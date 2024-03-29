module fifo (clk, arst, write_i, read_i, data_i, data_o, error_o, full_o, empty_o, ocup_o);

  input clk;
  input arst;
  input write_i;
  input read_i;
  input [7:0] data_i;
  output [7:0] data_o;
  output error_o;
  output full_o;
  output empty_o;
  output [1:0] ocup_o;

  wire [15:0] fifo_ff;
  wire [1:0] write_ptr_ff;
  wire [1:0] read_ptr_ff;
  wire [1:0] next_write_ptr;
  wire [1:0] next_read_ptr;
  wire [1:0] fifo_ocup;
  wire u1temp,u2temp,u4temp,full_o_not,u7temp,u9temp,u10carry,u11carry,empty_o_not,u13temp,u14temp,u15carry,u16carry,u17res,u18res,write_ptr_ff_0_not,write_ptr_ff_1_not,b0wire,b1wire,u23temp_not,u23temp,boutb,bouta,boutmain,arst_value;


  BUFX1 U00 ( .A(read_ptr_ff[0]), .Y(next_read_ptr[0]) );
  BUFX1 U01 ( .A(read_ptr_ff[1]), .Y(next_read_ptr[1]) );
  BUFX1 U02 ( .A(write_ptr_ff[0]), .Y(next_write_ptr[0]) );
  BUFX1 U03 ( .A(write_ptr_ff[1]), .Y(next_write_ptr[1]) );

  XNOR2X1 U1 ( .IN1(write_ptr_ff[0]), .IN2(read_ptr_ff[0]), .Q(u1temp) );
  XNOR2X1 U2 ( .IN1(write_ptr_ff[1]), .IN2(read_ptr_ff[1]), .Q(u2temp) );
  AND2X1 U3 ( .A(u1temp), .B(u2temp), .Y(empty_o) );
  XOR2X1 U4 ( .A(write_ptr_ff[1]), .B(read_ptr_ff[1]), .Y(u4temp) );
  AND2X1 U5 ( .A(u1temp), .B(u4temp), .Y(full_o) );
  MUX21X1 U6 (.IN1(fifo_ff[read_ptr_ff[0] * 8]), .IN2(1'b0), .S(empty_o), .Q(data_o[0]));
  MUX21X1 U61 (.IN1(fifo_ff[read_ptr_ff[0] * 8+1]), .IN2(1'b0), .S(empty_o), .Q(data_o[1]));
  MUX21X1 U62 (.IN1(fifo_ff[read_ptr_ff[0] * 8+2]), .IN2(1'b0), .S(empty_o), .Q(data_o[2]));
  MUX21X1 U63 (.IN1(fifo_ff[read_ptr_ff[0] * 8+3]), .IN2(1'b0), .S(empty_o), .Q(data_o[3]));
  MUX21X1 U64 (.IN1(fifo_ff[read_ptr_ff[0] * 8+4]), .IN2(1'b0), .S(empty_o), .Q(data_o[4]));
  MUX21X1 U65 (.IN1(fifo_ff[read_ptr_ff[0] * 8+5]), .IN2(1'b0), .S(empty_o), .Q(data_o[5]));
  MUX21X1 U66 (.IN1(fifo_ff[read_ptr_ff[0] * 8+6]), .IN2(1'b0), .S(empty_o), .Q(data_o[6]));
  MUX21X1 U67 (.IN1(fifo_ff[read_ptr_ff[0] * 8+7]), .IN2(1'b0), .S(empty_o), .Q(data_o[7]));

  INVX1 U7 ( .A(full_o), .Y(full_o_not) );
  AND2X1 U8 ( .A(write_i), .B(full_o_not), .Y(u7temp) );
  MUX21X1 U9 (.IN1(1'b0), .IN2(1'b1), .S(u7temp), .Q(u9temp));
  HADDX1 U10 ( .A0(write_ptr_ff[0]), .B0(u9temp), .C1(u10carry), .SO(next_write_ptr[0]) );
  HADDX1 U11 ( .A0(u10carry), .B0(write_ptr_ff[1]), .C1(u11carry), .SO(next_write_ptr[1]) );

  INVX1 U12 ( .A(empty_o), .Y(empty_o_not) );
  AND2X1 U13 ( .A(read_i), .B(empty_o_not), .Y(u13temp) );
  MUX21X1 U14 (.IN1(1'b0), .IN2(1'b1), .S(u13temp), .Q(u14temp));
  HADDX1 U15 ( .A0(read_ptr_ff[0]), .B0(u14temp), .C1(u15carry), .SO(next_read_ptr[0]) );
  HADDX1 U16 ( .A0(u15carry), .B0(read_ptr_ff[1]), .C1(u16carry), .SO(next_read_ptr[1]) );

  AND2X1 U17 ( .A(write_i), .B(full_o), .Y(u17res) );
  AND2X1 U18 ( .A(read_i), .B(empty_o), .Y(u18res) );
  OR2X1 U19 ( .A(u17res), .B(u18res), .Y(error_o) );

  XOR2X1 U20 ( .A(write_ptr_ff[0]), .B(read_ptr_ff[0]), .Y(fifo_ocup[0]) );
  INVX1 U21 ( .A(write_ptr_ff[0]), .Y(write_ptr_ff_0_not) );
  AND2X1 U22 ( .A(write_ptr_ff_0_not), .B(read_ptr_ff[0]), .Y(b0wire) );
  XOR2X1 U23 ( .A(write_ptr_ff[1]), .B(read_ptr_ff[1]), .Y(u23temp) );
  INVX1 U24 ( .A(write_ptr_ff[1]), .Y(write_ptr_ff_1_not) );
  AND2X1 U25 ( .A(read_ptr_ff[1]), .B(write_ptr_ff_1_not), .Y(boutb) );
  XOR2X1 U24 ( .A(u23temp), .B(b0wire), .Y(fifo_ocup[1]) );
  INVX1 U25 ( .A(u23temp), .Y(u23temp_not) );
  AND2X1 U26 ( .A(b0wire), .B(u23temp_not), .Y(bouta) );
  OR2X1 U27 ( .A(bouta), .B(boutb), .Y(boutmain) );
  DFFX2 U28 ( .CLK(clk), .D(fifo_ocup[0]), .Q(ocup_o[0]) );
  DFFX2 U29 ( .CLK(clk), .D(fifo_ocup[1]), .Q(ocup_o[1]) );

  DFFX2 U30 ( .CLK(clk), .D(arst), .Q(arst_value) );
  DFFX2 U31 ( .CLK(arst), .D(arst), .Q(arst_value) );
  DFFX2 U32 ( .CLK(arst_value), .D(1'b0), .Q(write_ptr_ff[0]) );
  DFFX2 U33 ( .CLK(arst_value), .D(1'b0), .Q(read_ptr_ff[0]) );
  DFFX2 U34 ( .CLK(arst_value), .D(1'b0), .Q(fifo_ff[0]) );
  DFFX2 U35 ( .CLK(arst_value), .D(1'b0), .Q(write_ptr_ff[1]) );
  DFFX2 U36 ( .CLK(arst_value), .D(1'b0), .Q(read_ptr_ff[1]) );
  DFFX2 U37 ( .CLK(arst_value), .D(1'b0), .Q(fifo_ff[1]) );

  DFFX2 U38 ( .CLK(clk), .D(next_write_ptr[0]), .Q(write_ptr_ff[0]) );
  DFFX2 U39 ( .CLK(clk), .D(next_write_ptr[1]), .Q(write_ptr_ff[1]) );
  DFFX2 U40 ( .CLK(clk), .D(next_read_ptr[0]), .Q(read_ptr_ff[0]) );
  DFFX2 U41 ( .CLK(clk), .D(next_read_ptr[1]), .Q(read_ptr_ff[1]) );
  

  DFFX2 U42 ( .CLK(u7temp), .D(data_i[0]), .Q(fifo_ff[write_ptr_ff[0]*8]) );
  DFFX2 U43 ( .CLK(u7temp), .D(data_i[1]), .Q(fifo_ff[write_ptr_ff[0]*8+1]) );
  DFFX2 U44 ( .CLK(u7temp), .D(data_i[2]), .Q(fifo_ff[write_ptr_ff[0]*8+2]) );
  DFFX2 U45 ( .CLK(u7temp), .D(data_i[3]), .Q(fifo_ff[write_ptr_ff[0]*8+3]) );
  DFFX2 U46 ( .CLK(u7temp), .D(data_i[4]), .Q(fifo_ff[write_ptr_ff[0]*8+4]) );
  DFFX2 U47 ( .CLK(u7temp), .D(data_i[5]), .Q(fifo_ff[write_ptr_ff[0]*8+5]) );
  DFFX2 U48 ( .CLK(u7temp), .D(data_i[6]), .Q(fifo_ff[write_ptr_ff[0]*8+6]) );
  DFFX2 U49 ( .CLK(u7temp), .D(data_i[7]), .Q(fifo_ff[write_ptr_ff[0]*8+7]) );

endmodule

