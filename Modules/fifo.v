module fifo (clk, arst, write_flit_vc_buffer, read_flit_vc_buffer, fdata_i, fdata_o, error_vc_buffer, full_vc_buffer, empty_vc_buffer, ocup_o);

  input clk;
  input arst;
  input write_flit_vc_buffer;
  input read_flit_vc_buffer;
  input [7:0] fdata_i;
  output [7:0] fdata_o;
  output error_vc_buffer;
  output full_vc_buffer;
  output empty_vc_buffer;
  output [1:0] ocup_o;

  wire [15:0] fifo_ff_fifomodule;
  wire [1:0] write_ptr_ff_fifomodule;
  wire [1:0] read_ptr_ff_fifomodule;
  wire [1:0] next_write_ptr_fifomodule;
  wire [1:0] next_read_ptr_fifomodule;
  wire [1:0] fifo_ocup_fifomodule;
  wire u1temp_fifomodule,u2temp_fifomodule,u4temp_fifomodule,full_vc_buffer_not_fifomodule,u7temp_fifomodule,u9temp_fifomodule,u10carry_fifomodule,u11carry_fifomodule,empty_vc_buffer_not_fifomodule,u13temp_fifomodule,u14temp_fifomodule,u15carry_fifomodule,u16carry_fifomodule,u17res_fifomodule,u18res_fifomodule,write_ptr_ff_fifomodule_0_not,write_ptr_ff_fifomodule_1_not,b0wire_fifomodule,b1wire_fifomodule,u23temp_fifomodule_not_fifomodule,u23temp_fifomodule,boutb_fifomodule,bouta_fifomodule,boutmain_fifomodule,arst_value_fifomodule;


  BUFX1 U00 ( .A(read_ptr_ff_fifomodule[0]), .Y(next_read_ptr_fifomodule[0]) );
  BUFX1 U01 ( .A(read_ptr_ff_fifomodule[1]), .Y(next_read_ptr_fifomodule[1]) );
  BUFX1 U02 ( .A(write_ptr_ff_fifomodule[0]), .Y(next_write_ptr_fifomodule[0]) );
  BUFX1 U03 ( .A(write_ptr_ff_fifomodule[1]), .Y(next_write_ptr_fifomodule[1]) );

  XNOR2X1 U1 ( .IN1(write_ptr_ff_fifomodule[0]), .IN2(read_ptr_ff_fifomodule[0]), .Q(u1temp_fifomodule) );
  XNOR2X1 U2 ( .IN1(write_ptr_ff_fifomodule[1]), .IN2(read_ptr_ff_fifomodule[1]), .Q(u2temp_fifomodule) );
  AND2X1 U3 ( .A(u1temp_fifomodule), .B(u2temp_fifomodule), .Y(empty_vc_buffer) );
  XOR2X1 U4 ( .A(write_ptr_ff_fifomodule[1]), .B(read_ptr_ff_fifomodule[1]), .Y(u4temp_fifomodule) );
  AND2X1 U5 ( .A(u1temp_fifomodule), .B(u4temp_fifomodule), .Y(full_vc_buffer) );
  MUX21X1 U6 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8]), .IN2(1'b0), .S(empty_vc_buffer), .Q(fdata_o[0]));
  MUX21X1 U61 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+1]), .IN2(1'b0), .S(empty_vc_buffer), .Q(fdata_o[1]));
  MUX21X1 U62 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+2]), .IN2(1'b0), .S(empty_vc_buffer), .Q(fdata_o[2]));
  MUX21X1 U63 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+3]), .IN2(1'b0), .S(empty_vc_buffer), .Q(fdata_o[3]));
  MUX21X1 U64 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+4]), .IN2(1'b0), .S(empty_vc_buffer), .Q(fdata_o[4]));
  MUX21X1 U65 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+5]), .IN2(1'b0), .S(empty_vc_buffer), .Q(fdata_o[5]));
  MUX21X1 U66 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+6]), .IN2(1'b0), .S(empty_vc_buffer), .Q(fdata_o[6]));
  MUX21X1 U67 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+7]), .IN2(1'b0), .S(empty_vc_buffer), .Q(fdata_o[7]));

  INVX1 U7 ( .A(full_vc_buffer), .Y(full_vc_buffer_not_fifomodule) );
  AND2X1 U8 ( .A(write_flit_vc_buffer), .B(full_vc_buffer_not_fifomodule), .Y(u7temp_fifomodule) );
  MUX21X1 U9 (.IN1(1'b0), .IN2(1'b1), .S(u7temp_fifomodule), .Q(u9temp_fifomodule));
  HADDX1 U10 ( .A0(write_ptr_ff_fifomodule[0]), .B0(u9temp_fifomodule), .C1(u10carry_fifomodule), .SO(next_write_ptr_fifomodule[0]) );
  HADDX1 U11 ( .A0(u10carry_fifomodule), .B0(write_ptr_ff_fifomodule[1]), .C1(u11carry_fifomodule), .SO(next_write_ptr_fifomodule[1]) );

  INVX1 U12 ( .A(empty_vc_buffer), .Y(empty_vc_buffer_not_fifomodule) );
  AND2X1 U13 ( .A(read_flit_vc_buffer), .B(empty_vc_buffer_not_fifomodule), .Y(u13temp_fifomodule) );
  MUX21X1 U14 (.IN1(1'b0), .IN2(1'b1), .S(u13temp_fifomodule), .Q(u14temp_fifomodule));
  HADDX1 U15 ( .A0(read_ptr_ff_fifomodule[0]), .B0(u14temp_fifomodule), .C1(u15carry_fifomodule), .SO(next_read_ptr_fifomodule[0]) );
  HADDX1 U16 ( .A0(u15carry_fifomodule), .B0(read_ptr_ff_fifomodule[1]), .C1(u16carry_fifomodule), .SO(next_read_ptr_fifomodule[1]) );

  AND2X1 U17 ( .A(write_flit_vc_buffer), .B(full_vc_buffer), .Y(u17res_fifomodule) );
  AND2X1 U18 ( .A(read_flit_vc_buffer), .B(empty_vc_buffer), .Y(u18res_fifomodule) );
  OR2X1 U19 ( .A(u17res_fifomodule), .B(u18res_fifomodule), .Y(error_vc_buffer) );

  XOR2X1 U20 ( .A(write_ptr_ff_fifomodule[0]), .B(read_ptr_ff_fifomodule[0]), .Y(fifo_ocup_fifomodule[0]) );
  INVX1 U21 ( .A(write_ptr_ff_fifomodule[0]), .Y(write_ptr_ff_fifomodule_0_not) );
  AND2X1 U22 ( .A(write_ptr_ff_fifomodule_0_not), .B(read_ptr_ff_fifomodule[0]), .Y(b0wire_fifomodule) );
  XOR2X1 U23 ( .A(write_ptr_ff_fifomodule[1]), .B(read_ptr_ff_fifomodule[1]), .Y(u23temp_fifomodule) );
  INVX1 U24 ( .A(write_ptr_ff_fifomodule[1]), .Y(write_ptr_ff_fifomodule_1_not) );
  AND2X1 U25 ( .A(read_ptr_ff_fifomodule[1]), .B(write_ptr_ff_fifomodule_1_not), .Y(boutb_fifomodule) );
  XOR2X1 U24 ( .A(u23temp_fifomodule), .B(b0wire_fifomodule), .Y(fifo_ocup_fifomodule[1]) );
  INVX1 U25 ( .A(u23temp_fifomodule), .Y(u23temp_fifomodule_not_fifomodule) );
  AND2X1 U26 ( .A(b0wire_fifomodule), .B(u23temp_fifomodule_not_fifomodule), .Y(bouta_fifomodule) );
  OR2X1 U27 ( .A(bouta_fifomodule), .B(boutb_fifomodule), .Y(boutmain_fifomodule) );
  DFFX2 U28 ( .CLK(clk), .D(fifo_ocup_fifomodule[0]), .Q(ocup_o[0]) );
  DFFX2 U29 ( .CLK(clk), .D(fifo_ocup_fifomodule[1]), .Q(ocup_o[1]) );

  DFFX2 U30 ( .CLK(clk), .D(arst), .Q(arst_value_fifomodule) );
  DFFX2 U31 ( .CLK(arst), .D(arst), .Q(arst_value_fifomodule) );
  DFFX2 U32 ( .CLK(arst_value_fifomodule), .D(1'b0), .Q(write_ptr_ff_fifomodule[0]) );
  DFFX2 U33 ( .CLK(arst_value_fifomodule), .D(1'b0), .Q(read_ptr_ff_fifomodule[0]) );
  DFFX2 U34 ( .CLK(arst_value_fifomodule), .D(1'b0), .Q(fifo_ff_fifomodule[0]) );
  DFFX2 U35 ( .CLK(arst_value_fifomodule), .D(1'b0), .Q(write_ptr_ff_fifomodule[1]) );
  DFFX2 U36 ( .CLK(arst_value_fifomodule), .D(1'b0), .Q(read_ptr_ff_fifomodule[1]) );
  DFFX2 U37 ( .CLK(arst_value_fifomodule), .D(1'b0), .Q(fifo_ff_fifomodule[1]) );

  DFFX2 U38 ( .CLK(clk), .D(next_write_ptr_fifomodule[0]), .Q(write_ptr_ff_fifomodule[0]) );
  DFFX2 U39 ( .CLK(clk), .D(next_write_ptr_fifomodule[1]), .Q(write_ptr_ff_fifomodule[1]) );
  DFFX2 U40 ( .CLK(clk), .D(next_read_ptr_fifomodule[0]), .Q(read_ptr_ff_fifomodule[0]) );
  DFFX2 U41 ( .CLK(clk), .D(next_read_ptr_fifomodule[1]), .Q(read_ptr_ff_fifomodule[1]) );
  

  DFFX2 U42 ( .CLK(u7temp_fifomodule), .D(fdata_i[0]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8]) );
  DFFX2 U43 ( .CLK(u7temp_fifomodule), .D(fdata_i[1]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+1]) );
  DFFX2 U44 ( .CLK(u7temp_fifomodule), .D(fdata_i[2]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+2]) );
  DFFX2 U45 ( .CLK(u7temp_fifomodule), .D(fdata_i[3]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+3]) );
  DFFX2 U46 ( .CLK(u7temp_fifomodule), .D(fdata_i[4]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+4]) );
  DFFX2 U47 ( .CLK(u7temp_fifomodule), .D(fdata_i[5]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+5]) );
  DFFX2 U48 ( .CLK(u7temp_fifomodule), .D(fdata_i[6]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+6]) );
  DFFX2 U49 ( .CLK(u7temp_fifomodule), .D(fdata_i[7]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+7]) );

endmodule

