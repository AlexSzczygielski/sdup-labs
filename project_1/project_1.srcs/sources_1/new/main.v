//-----------------------------------------------------------------------------
// 4 Channel PWM driver
//-----------------------------------------------------------------------------

module pwm_driver_top
(
// inputs
input wire CLK,
input wire [5 : 0] SW,
input wire [3 : 0] BTN,
// outputs
output reg [3 : 0] PWM_OUT
);

//¿eby liczba siê zawsze zgadza³a counter musi mieæ 16 stanów
//czyli CLK musi byc dwa 16 razy szybsze od wymahanej czêstotliwoœci wyjœcia 50 Hz
//czyli bêdzie wynois³ 800 Hz, a okres bêdzie wtedy wynoisi³ 0,00125 s

//poniewa¿ na CLK jest zegar z mikrokontrolera trzeba go zmieniæ na taki jaki my chcemy
reg inner_CLK;
reg [15 : 0] inner_CLK_counter;
`define INNER_CLK_MAX 31250

//counter mówi ile ma przejœæ cykli zegara zanim stan zostanie zmieniony
reg [3 : 0] counter;

//rejestry odpowiadaj¹ce za zmianê ustawieñ kana³ów odpowiednio od 0 do 3
reg [1 : 0] selected;
reg [3 : 0] allignment;
reg [3 : 0] x_true_pulse;

//zapisywanie poziomu
//dla ka¿dego z czterech kana³ów s¹ 4 bity z tych rejestrów
reg [15 : 0] saved_level;
reg [15 : 0] width;
reg [15 : 0] offset;
reg [3 : 0] true_pulse;

//debouncer
reg [11 : 0] debouncer;

initial begin
    inner_CLK <= 0;
    inner_CLK_counter <= 0;
    counter <= 0;
    selected <= 0;
    allignment <= 0;
    x_true_pulse <= 0;
    saved_level <= 0;
    width <= 0;
    offset <= 0;
    true_pulse <= 0;
    debouncer <= 0;
end

//zmiana czêstotliwoœci zegara
always @(posedge CLK) begin
    if(inner_CLK_counter < `INNER_CLK_MAX)begin
        inner_CLK_counter <= inner_CLK_counter + 1;
    end else begin
        inner_CLK_counter <= 0;
        inner_CLK <= ~inner_CLK;
    end
end

//licznik 16 bitowy który wewnêtnie steruje PWM
always @(posedge inner_CLK) begin
    if(counter == 15)begin
        counter <= 0;
    end else begin
        counter <= counter + 1;
    end
end

genvar i;
generate
for(i = 0 ; i < 4 ; i = i + 1)
begin

    //logika PWM
    always @(posedge inner_CLK) begin
        
        if(counter == 0)begin
        width[(i*4)+3 : (i*4)] <= saved_level[(i*4)+3 : (i*4)];
            if(allignment[i] == 0)begin
                offset[(i*4)+3 : (i*4)] <= (15 - saved_level[(i*4)+3 : (i*4)]) >> 1;
            end else begin                
                offset[(i*4)+3 : (i*4)] <= 0;
            end
        end
        
        if(offset[(i*4)+3 : (i*4)] != 0)begin
            offset[(i*4)+3 : (i*4)] <= offset[(i*4)+3 : (i*4)] - 1;
            true_pulse[i] <= 0;
        end else begin
            if(width[(i*4)+3 : (i*4)] != 0)begin
                true_pulse[i] <= 1;
                width[(i*4)+3 : (i*4)] <= width[(i*4)+3 : (i*4)] - 1;
            end else begin
                true_pulse[i] <= 0;
            end
        end
        
        //wybór pomiêdzy high, a low true pulses
        if(x_true_pulse[i] == 1)begin
            PWM_OUT[i] <= true_pulse[i];
        end else begin
            PWM_OUT[i] <= !true_pulse[i];
        end
        
    end
    
end
endgenerate

//logika ustawieñ
always @(posedge inner_CLK) begin
    if(selected == 0)begin
        x_true_pulse[0] <= SW[5];
        allignment[0] <= SW[4];
        saved_level[3 : 0] <= SW[3 : 0];
    end else if(selected == 1)begin
        x_true_pulse[1] <= SW[5];
        allignment[1] <= SW[4];
        saved_level[7 : 4] <= SW[3 : 0];
    end else if(selected == 2)begin
        x_true_pulse[2] <= SW[5];
        allignment[2] <= SW[4];
        saved_level[11 : 8] <= SW[3 : 0];
    end else if(selected == 3)begin
        x_true_pulse[3] <= SW[5];
        allignment[3] <= SW[4];
        saved_level[15 : 12] <= SW[3 : 0];
    end
end
    
//logika wybierania kana³u z debouncerami
always @(posedge CLK) begin

    //przycisk 0
    if(BTN == 4'b0001)begin
        debouncer[2 : 0] <= debouncer[2 : 0] + 1;
        if(debouncer[2 : 0] == 7)begin
            selected <= 0;
            debouncer[2 : 0] <= 0;
        end
    end else begin
        debouncer[2 : 0] <= 0;
    end
    
    //przycisk 1
    if(BTN == 4'b0010)begin
        debouncer[5 : 3] <= debouncer[5 : 3] + 1;
        if(debouncer[5 : 3] == 7)begin
            selected <= 1;
            debouncer[5 : 3] <= 0;
        end
    end else begin
        debouncer[5 : 3] <= 0;
    end
    
    //przycisk 2
    if(BTN == 4'b0100)begin
        debouncer[8 : 6] <= debouncer[8 : 6] + 1;
        if(debouncer[8 : 6] == 7)begin
            selected <= 2;
            debouncer[8 : 6] <= 0;
        end
    end else begin
        debouncer[8 : 6] <= 0;
    end
    
    //przycisk 3
    if(BTN == 4'b1000)begin
        debouncer[11 : 9] <= debouncer[11 : 9] + 1;
        if(debouncer[11 : 9] == 7)begin
            selected <= 3;
            debouncer[11 : 9] <= 0;
        end
    end else begin
        debouncer[11 : 9] <= 0;
    end
    
end

endmodule