//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Wed Apr  1 01:28:35 2026
//Host        : PC-Eryk running 64-bit major release  (build 9200)
//Command     : generate_target mb_design_wrapper.bd
//Design      : mb_design_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mb_design_wrapper
   (clock_clk_n,
    clock_clk_p,
    gpio_angle_tri_io,
    gpio_cos_tri_io,
    gpio_sin_tri_io,
    reset,
    reset_n);
  input clock_clk_n;
  input clock_clk_p;
  inout [11:0]gpio_angle_tri_io;
  inout [11:0]gpio_cos_tri_io;
  inout [11:0]gpio_sin_tri_io;
  input reset;
  input reset_n;

  wire clock_clk_n;
  wire clock_clk_p;
  wire [0:0]gpio_angle_tri_i_0;
  wire [1:1]gpio_angle_tri_i_1;
  wire [10:10]gpio_angle_tri_i_10;
  wire [11:11]gpio_angle_tri_i_11;
  wire [2:2]gpio_angle_tri_i_2;
  wire [3:3]gpio_angle_tri_i_3;
  wire [4:4]gpio_angle_tri_i_4;
  wire [5:5]gpio_angle_tri_i_5;
  wire [6:6]gpio_angle_tri_i_6;
  wire [7:7]gpio_angle_tri_i_7;
  wire [8:8]gpio_angle_tri_i_8;
  wire [9:9]gpio_angle_tri_i_9;
  wire [0:0]gpio_angle_tri_io_0;
  wire [1:1]gpio_angle_tri_io_1;
  wire [10:10]gpio_angle_tri_io_10;
  wire [11:11]gpio_angle_tri_io_11;
  wire [2:2]gpio_angle_tri_io_2;
  wire [3:3]gpio_angle_tri_io_3;
  wire [4:4]gpio_angle_tri_io_4;
  wire [5:5]gpio_angle_tri_io_5;
  wire [6:6]gpio_angle_tri_io_6;
  wire [7:7]gpio_angle_tri_io_7;
  wire [8:8]gpio_angle_tri_io_8;
  wire [9:9]gpio_angle_tri_io_9;
  wire [0:0]gpio_angle_tri_o_0;
  wire [1:1]gpio_angle_tri_o_1;
  wire [10:10]gpio_angle_tri_o_10;
  wire [11:11]gpio_angle_tri_o_11;
  wire [2:2]gpio_angle_tri_o_2;
  wire [3:3]gpio_angle_tri_o_3;
  wire [4:4]gpio_angle_tri_o_4;
  wire [5:5]gpio_angle_tri_o_5;
  wire [6:6]gpio_angle_tri_o_6;
  wire [7:7]gpio_angle_tri_o_7;
  wire [8:8]gpio_angle_tri_o_8;
  wire [9:9]gpio_angle_tri_o_9;
  wire [0:0]gpio_angle_tri_t_0;
  wire [1:1]gpio_angle_tri_t_1;
  wire [10:10]gpio_angle_tri_t_10;
  wire [11:11]gpio_angle_tri_t_11;
  wire [2:2]gpio_angle_tri_t_2;
  wire [3:3]gpio_angle_tri_t_3;
  wire [4:4]gpio_angle_tri_t_4;
  wire [5:5]gpio_angle_tri_t_5;
  wire [6:6]gpio_angle_tri_t_6;
  wire [7:7]gpio_angle_tri_t_7;
  wire [8:8]gpio_angle_tri_t_8;
  wire [9:9]gpio_angle_tri_t_9;
  wire [0:0]gpio_cos_tri_i_0;
  wire [1:1]gpio_cos_tri_i_1;
  wire [10:10]gpio_cos_tri_i_10;
  wire [11:11]gpio_cos_tri_i_11;
  wire [2:2]gpio_cos_tri_i_2;
  wire [3:3]gpio_cos_tri_i_3;
  wire [4:4]gpio_cos_tri_i_4;
  wire [5:5]gpio_cos_tri_i_5;
  wire [6:6]gpio_cos_tri_i_6;
  wire [7:7]gpio_cos_tri_i_7;
  wire [8:8]gpio_cos_tri_i_8;
  wire [9:9]gpio_cos_tri_i_9;
  wire [0:0]gpio_cos_tri_io_0;
  wire [1:1]gpio_cos_tri_io_1;
  wire [10:10]gpio_cos_tri_io_10;
  wire [11:11]gpio_cos_tri_io_11;
  wire [2:2]gpio_cos_tri_io_2;
  wire [3:3]gpio_cos_tri_io_3;
  wire [4:4]gpio_cos_tri_io_4;
  wire [5:5]gpio_cos_tri_io_5;
  wire [6:6]gpio_cos_tri_io_6;
  wire [7:7]gpio_cos_tri_io_7;
  wire [8:8]gpio_cos_tri_io_8;
  wire [9:9]gpio_cos_tri_io_9;
  wire [0:0]gpio_cos_tri_o_0;
  wire [1:1]gpio_cos_tri_o_1;
  wire [10:10]gpio_cos_tri_o_10;
  wire [11:11]gpio_cos_tri_o_11;
  wire [2:2]gpio_cos_tri_o_2;
  wire [3:3]gpio_cos_tri_o_3;
  wire [4:4]gpio_cos_tri_o_4;
  wire [5:5]gpio_cos_tri_o_5;
  wire [6:6]gpio_cos_tri_o_6;
  wire [7:7]gpio_cos_tri_o_7;
  wire [8:8]gpio_cos_tri_o_8;
  wire [9:9]gpio_cos_tri_o_9;
  wire [0:0]gpio_cos_tri_t_0;
  wire [1:1]gpio_cos_tri_t_1;
  wire [10:10]gpio_cos_tri_t_10;
  wire [11:11]gpio_cos_tri_t_11;
  wire [2:2]gpio_cos_tri_t_2;
  wire [3:3]gpio_cos_tri_t_3;
  wire [4:4]gpio_cos_tri_t_4;
  wire [5:5]gpio_cos_tri_t_5;
  wire [6:6]gpio_cos_tri_t_6;
  wire [7:7]gpio_cos_tri_t_7;
  wire [8:8]gpio_cos_tri_t_8;
  wire [9:9]gpio_cos_tri_t_9;
  wire [0:0]gpio_sin_tri_i_0;
  wire [1:1]gpio_sin_tri_i_1;
  wire [10:10]gpio_sin_tri_i_10;
  wire [11:11]gpio_sin_tri_i_11;
  wire [2:2]gpio_sin_tri_i_2;
  wire [3:3]gpio_sin_tri_i_3;
  wire [4:4]gpio_sin_tri_i_4;
  wire [5:5]gpio_sin_tri_i_5;
  wire [6:6]gpio_sin_tri_i_6;
  wire [7:7]gpio_sin_tri_i_7;
  wire [8:8]gpio_sin_tri_i_8;
  wire [9:9]gpio_sin_tri_i_9;
  wire [0:0]gpio_sin_tri_io_0;
  wire [1:1]gpio_sin_tri_io_1;
  wire [10:10]gpio_sin_tri_io_10;
  wire [11:11]gpio_sin_tri_io_11;
  wire [2:2]gpio_sin_tri_io_2;
  wire [3:3]gpio_sin_tri_io_3;
  wire [4:4]gpio_sin_tri_io_4;
  wire [5:5]gpio_sin_tri_io_5;
  wire [6:6]gpio_sin_tri_io_6;
  wire [7:7]gpio_sin_tri_io_7;
  wire [8:8]gpio_sin_tri_io_8;
  wire [9:9]gpio_sin_tri_io_9;
  wire [0:0]gpio_sin_tri_o_0;
  wire [1:1]gpio_sin_tri_o_1;
  wire [10:10]gpio_sin_tri_o_10;
  wire [11:11]gpio_sin_tri_o_11;
  wire [2:2]gpio_sin_tri_o_2;
  wire [3:3]gpio_sin_tri_o_3;
  wire [4:4]gpio_sin_tri_o_4;
  wire [5:5]gpio_sin_tri_o_5;
  wire [6:6]gpio_sin_tri_o_6;
  wire [7:7]gpio_sin_tri_o_7;
  wire [8:8]gpio_sin_tri_o_8;
  wire [9:9]gpio_sin_tri_o_9;
  wire [0:0]gpio_sin_tri_t_0;
  wire [1:1]gpio_sin_tri_t_1;
  wire [10:10]gpio_sin_tri_t_10;
  wire [11:11]gpio_sin_tri_t_11;
  wire [2:2]gpio_sin_tri_t_2;
  wire [3:3]gpio_sin_tri_t_3;
  wire [4:4]gpio_sin_tri_t_4;
  wire [5:5]gpio_sin_tri_t_5;
  wire [6:6]gpio_sin_tri_t_6;
  wire [7:7]gpio_sin_tri_t_7;
  wire [8:8]gpio_sin_tri_t_8;
  wire [9:9]gpio_sin_tri_t_9;
  wire reset;
  wire reset_n;

  IOBUF gpio_angle_tri_iobuf_0
       (.I(gpio_angle_tri_o_0),
        .IO(gpio_angle_tri_io[0]),
        .O(gpio_angle_tri_i_0),
        .T(gpio_angle_tri_t_0));
  IOBUF gpio_angle_tri_iobuf_1
       (.I(gpio_angle_tri_o_1),
        .IO(gpio_angle_tri_io[1]),
        .O(gpio_angle_tri_i_1),
        .T(gpio_angle_tri_t_1));
  IOBUF gpio_angle_tri_iobuf_10
       (.I(gpio_angle_tri_o_10),
        .IO(gpio_angle_tri_io[10]),
        .O(gpio_angle_tri_i_10),
        .T(gpio_angle_tri_t_10));
  IOBUF gpio_angle_tri_iobuf_11
       (.I(gpio_angle_tri_o_11),
        .IO(gpio_angle_tri_io[11]),
        .O(gpio_angle_tri_i_11),
        .T(gpio_angle_tri_t_11));
  IOBUF gpio_angle_tri_iobuf_2
       (.I(gpio_angle_tri_o_2),
        .IO(gpio_angle_tri_io[2]),
        .O(gpio_angle_tri_i_2),
        .T(gpio_angle_tri_t_2));
  IOBUF gpio_angle_tri_iobuf_3
       (.I(gpio_angle_tri_o_3),
        .IO(gpio_angle_tri_io[3]),
        .O(gpio_angle_tri_i_3),
        .T(gpio_angle_tri_t_3));
  IOBUF gpio_angle_tri_iobuf_4
       (.I(gpio_angle_tri_o_4),
        .IO(gpio_angle_tri_io[4]),
        .O(gpio_angle_tri_i_4),
        .T(gpio_angle_tri_t_4));
  IOBUF gpio_angle_tri_iobuf_5
       (.I(gpio_angle_tri_o_5),
        .IO(gpio_angle_tri_io[5]),
        .O(gpio_angle_tri_i_5),
        .T(gpio_angle_tri_t_5));
  IOBUF gpio_angle_tri_iobuf_6
       (.I(gpio_angle_tri_o_6),
        .IO(gpio_angle_tri_io[6]),
        .O(gpio_angle_tri_i_6),
        .T(gpio_angle_tri_t_6));
  IOBUF gpio_angle_tri_iobuf_7
       (.I(gpio_angle_tri_o_7),
        .IO(gpio_angle_tri_io[7]),
        .O(gpio_angle_tri_i_7),
        .T(gpio_angle_tri_t_7));
  IOBUF gpio_angle_tri_iobuf_8
       (.I(gpio_angle_tri_o_8),
        .IO(gpio_angle_tri_io[8]),
        .O(gpio_angle_tri_i_8),
        .T(gpio_angle_tri_t_8));
  IOBUF gpio_angle_tri_iobuf_9
       (.I(gpio_angle_tri_o_9),
        .IO(gpio_angle_tri_io[9]),
        .O(gpio_angle_tri_i_9),
        .T(gpio_angle_tri_t_9));
  IOBUF gpio_cos_tri_iobuf_0
       (.I(gpio_cos_tri_o_0),
        .IO(gpio_cos_tri_io[0]),
        .O(gpio_cos_tri_i_0),
        .T(gpio_cos_tri_t_0));
  IOBUF gpio_cos_tri_iobuf_1
       (.I(gpio_cos_tri_o_1),
        .IO(gpio_cos_tri_io[1]),
        .O(gpio_cos_tri_i_1),
        .T(gpio_cos_tri_t_1));
  IOBUF gpio_cos_tri_iobuf_10
       (.I(gpio_cos_tri_o_10),
        .IO(gpio_cos_tri_io[10]),
        .O(gpio_cos_tri_i_10),
        .T(gpio_cos_tri_t_10));
  IOBUF gpio_cos_tri_iobuf_11
       (.I(gpio_cos_tri_o_11),
        .IO(gpio_cos_tri_io[11]),
        .O(gpio_cos_tri_i_11),
        .T(gpio_cos_tri_t_11));
  IOBUF gpio_cos_tri_iobuf_2
       (.I(gpio_cos_tri_o_2),
        .IO(gpio_cos_tri_io[2]),
        .O(gpio_cos_tri_i_2),
        .T(gpio_cos_tri_t_2));
  IOBUF gpio_cos_tri_iobuf_3
       (.I(gpio_cos_tri_o_3),
        .IO(gpio_cos_tri_io[3]),
        .O(gpio_cos_tri_i_3),
        .T(gpio_cos_tri_t_3));
  IOBUF gpio_cos_tri_iobuf_4
       (.I(gpio_cos_tri_o_4),
        .IO(gpio_cos_tri_io[4]),
        .O(gpio_cos_tri_i_4),
        .T(gpio_cos_tri_t_4));
  IOBUF gpio_cos_tri_iobuf_5
       (.I(gpio_cos_tri_o_5),
        .IO(gpio_cos_tri_io[5]),
        .O(gpio_cos_tri_i_5),
        .T(gpio_cos_tri_t_5));
  IOBUF gpio_cos_tri_iobuf_6
       (.I(gpio_cos_tri_o_6),
        .IO(gpio_cos_tri_io[6]),
        .O(gpio_cos_tri_i_6),
        .T(gpio_cos_tri_t_6));
  IOBUF gpio_cos_tri_iobuf_7
       (.I(gpio_cos_tri_o_7),
        .IO(gpio_cos_tri_io[7]),
        .O(gpio_cos_tri_i_7),
        .T(gpio_cos_tri_t_7));
  IOBUF gpio_cos_tri_iobuf_8
       (.I(gpio_cos_tri_o_8),
        .IO(gpio_cos_tri_io[8]),
        .O(gpio_cos_tri_i_8),
        .T(gpio_cos_tri_t_8));
  IOBUF gpio_cos_tri_iobuf_9
       (.I(gpio_cos_tri_o_9),
        .IO(gpio_cos_tri_io[9]),
        .O(gpio_cos_tri_i_9),
        .T(gpio_cos_tri_t_9));
  IOBUF gpio_sin_tri_iobuf_0
       (.I(gpio_sin_tri_o_0),
        .IO(gpio_sin_tri_io[0]),
        .O(gpio_sin_tri_i_0),
        .T(gpio_sin_tri_t_0));
  IOBUF gpio_sin_tri_iobuf_1
       (.I(gpio_sin_tri_o_1),
        .IO(gpio_sin_tri_io[1]),
        .O(gpio_sin_tri_i_1),
        .T(gpio_sin_tri_t_1));
  IOBUF gpio_sin_tri_iobuf_10
       (.I(gpio_sin_tri_o_10),
        .IO(gpio_sin_tri_io[10]),
        .O(gpio_sin_tri_i_10),
        .T(gpio_sin_tri_t_10));
  IOBUF gpio_sin_tri_iobuf_11
       (.I(gpio_sin_tri_o_11),
        .IO(gpio_sin_tri_io[11]),
        .O(gpio_sin_tri_i_11),
        .T(gpio_sin_tri_t_11));
  IOBUF gpio_sin_tri_iobuf_2
       (.I(gpio_sin_tri_o_2),
        .IO(gpio_sin_tri_io[2]),
        .O(gpio_sin_tri_i_2),
        .T(gpio_sin_tri_t_2));
  IOBUF gpio_sin_tri_iobuf_3
       (.I(gpio_sin_tri_o_3),
        .IO(gpio_sin_tri_io[3]),
        .O(gpio_sin_tri_i_3),
        .T(gpio_sin_tri_t_3));
  IOBUF gpio_sin_tri_iobuf_4
       (.I(gpio_sin_tri_o_4),
        .IO(gpio_sin_tri_io[4]),
        .O(gpio_sin_tri_i_4),
        .T(gpio_sin_tri_t_4));
  IOBUF gpio_sin_tri_iobuf_5
       (.I(gpio_sin_tri_o_5),
        .IO(gpio_sin_tri_io[5]),
        .O(gpio_sin_tri_i_5),
        .T(gpio_sin_tri_t_5));
  IOBUF gpio_sin_tri_iobuf_6
       (.I(gpio_sin_tri_o_6),
        .IO(gpio_sin_tri_io[6]),
        .O(gpio_sin_tri_i_6),
        .T(gpio_sin_tri_t_6));
  IOBUF gpio_sin_tri_iobuf_7
       (.I(gpio_sin_tri_o_7),
        .IO(gpio_sin_tri_io[7]),
        .O(gpio_sin_tri_i_7),
        .T(gpio_sin_tri_t_7));
  IOBUF gpio_sin_tri_iobuf_8
       (.I(gpio_sin_tri_o_8),
        .IO(gpio_sin_tri_io[8]),
        .O(gpio_sin_tri_i_8),
        .T(gpio_sin_tri_t_8));
  IOBUF gpio_sin_tri_iobuf_9
       (.I(gpio_sin_tri_o_9),
        .IO(gpio_sin_tri_io[9]),
        .O(gpio_sin_tri_i_9),
        .T(gpio_sin_tri_t_9));
  mb_design mb_design_i
       (.clock_clk_n(clock_clk_n),
        .clock_clk_p(clock_clk_p),
        .gpio_angle_tri_i({gpio_angle_tri_i_11,gpio_angle_tri_i_10,gpio_angle_tri_i_9,gpio_angle_tri_i_8,gpio_angle_tri_i_7,gpio_angle_tri_i_6,gpio_angle_tri_i_5,gpio_angle_tri_i_4,gpio_angle_tri_i_3,gpio_angle_tri_i_2,gpio_angle_tri_i_1,gpio_angle_tri_i_0}),
        .gpio_angle_tri_o({gpio_angle_tri_o_11,gpio_angle_tri_o_10,gpio_angle_tri_o_9,gpio_angle_tri_o_8,gpio_angle_tri_o_7,gpio_angle_tri_o_6,gpio_angle_tri_o_5,gpio_angle_tri_o_4,gpio_angle_tri_o_3,gpio_angle_tri_o_2,gpio_angle_tri_o_1,gpio_angle_tri_o_0}),
        .gpio_angle_tri_t({gpio_angle_tri_t_11,gpio_angle_tri_t_10,gpio_angle_tri_t_9,gpio_angle_tri_t_8,gpio_angle_tri_t_7,gpio_angle_tri_t_6,gpio_angle_tri_t_5,gpio_angle_tri_t_4,gpio_angle_tri_t_3,gpio_angle_tri_t_2,gpio_angle_tri_t_1,gpio_angle_tri_t_0}),
        .gpio_cos_tri_i({gpio_cos_tri_i_11,gpio_cos_tri_i_10,gpio_cos_tri_i_9,gpio_cos_tri_i_8,gpio_cos_tri_i_7,gpio_cos_tri_i_6,gpio_cos_tri_i_5,gpio_cos_tri_i_4,gpio_cos_tri_i_3,gpio_cos_tri_i_2,gpio_cos_tri_i_1,gpio_cos_tri_i_0}),
        .gpio_cos_tri_o({gpio_cos_tri_o_11,gpio_cos_tri_o_10,gpio_cos_tri_o_9,gpio_cos_tri_o_8,gpio_cos_tri_o_7,gpio_cos_tri_o_6,gpio_cos_tri_o_5,gpio_cos_tri_o_4,gpio_cos_tri_o_3,gpio_cos_tri_o_2,gpio_cos_tri_o_1,gpio_cos_tri_o_0}),
        .gpio_cos_tri_t({gpio_cos_tri_t_11,gpio_cos_tri_t_10,gpio_cos_tri_t_9,gpio_cos_tri_t_8,gpio_cos_tri_t_7,gpio_cos_tri_t_6,gpio_cos_tri_t_5,gpio_cos_tri_t_4,gpio_cos_tri_t_3,gpio_cos_tri_t_2,gpio_cos_tri_t_1,gpio_cos_tri_t_0}),
        .gpio_sin_tri_i({gpio_sin_tri_i_11,gpio_sin_tri_i_10,gpio_sin_tri_i_9,gpio_sin_tri_i_8,gpio_sin_tri_i_7,gpio_sin_tri_i_6,gpio_sin_tri_i_5,gpio_sin_tri_i_4,gpio_sin_tri_i_3,gpio_sin_tri_i_2,gpio_sin_tri_i_1,gpio_sin_tri_i_0}),
        .gpio_sin_tri_o({gpio_sin_tri_o_11,gpio_sin_tri_o_10,gpio_sin_tri_o_9,gpio_sin_tri_o_8,gpio_sin_tri_o_7,gpio_sin_tri_o_6,gpio_sin_tri_o_5,gpio_sin_tri_o_4,gpio_sin_tri_o_3,gpio_sin_tri_o_2,gpio_sin_tri_o_1,gpio_sin_tri_o_0}),
        .gpio_sin_tri_t({gpio_sin_tri_t_11,gpio_sin_tri_t_10,gpio_sin_tri_t_9,gpio_sin_tri_t_8,gpio_sin_tri_t_7,gpio_sin_tri_t_6,gpio_sin_tri_t_5,gpio_sin_tri_t_4,gpio_sin_tri_t_3,gpio_sin_tri_t_2,gpio_sin_tri_t_1,gpio_sin_tri_t_0}),
        .reset(reset),
        .reset_n(reset_n));
endmodule
