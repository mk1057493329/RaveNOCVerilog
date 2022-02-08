module input_datapath (clk,arst,fin_req_i,fin_resp_o,fout_req_o,fout_resp_i);
	input clk;
	input arst;
	input wire [36:0] fin_req_i;
	output [0:0] fin_resp_o;
	output [36:0] fout_req_o;
	input [0:0] fout_resp_i;
	wire [110:0] from_input_req_in_jump_input_datapathput_datapath;
	wire [2:0] from_input_resp_input_datapath;
	wire [110:0] to_output_req_in_jump_input_datapathput_datapath;
	wire [2:0] to_output_resp_input_datapath;
	wire [1:0] vc_ch_act_in_input_datapath;
	wire [1:0] vc_ch_act_out_input_datapath;
	wire [2:0] i;
	wire [2:0] j;
	wire [0:1] _sv2v_jump_input_datapath

	wire req_in_jump_input_datapath,req_out_jump_input_datapath,xnor1resu_input_datapath,xnor2resu_input_datapath,and1resu_input_datapath,cond1line_input_datapath,req_in_jump_input_datapath_not,and2resu_input_datapath,xor1resu_input_datapath,nand1resu_input_datapath,xnor23resu_input_datapath,and4resu_input_datapath,write_flit_vc_buffer,norres_vc_buffer_vc_buffer,full_vc_buffer,empty_vc_buffer,error_vc_buffer,read_flit_vc_buffer,locked_by_route_ff_vc_buffer,next_locked_vc_buffer,orres_vc_buffer,or1res_vc_buffer,or2res_vc_buffer,finres1_vc_buffer,andres1_vc_buffer,full_vc_buffer_not,locked_by_route_ff_vc_buffer_not,thirdand_vc_buffer,u1temp_fifomodule,u2temp_fifomodule,u4temp_fifomodule,full_vc_buffer_not_fifomodule,u7temp_fifomodule,u9temp_fifomodule,u10carry_fifomodule,u11carry_fifomodule,empty_vc_buffer_not_fifomodule,u13temp_fifomodule,u14temp_fifomodule,u15carry_fifomodule,u16carry_fifomodule,u17res_fifomodule,u18res_fifomodule,write_ptr_ff_fifomodule_0_not,write_ptr_ff_fifomodule_1_not,b0wire_fifomodule,b1wire_fifomodule,u23temp_fifomodule_not_fifomodule,u23temp_fifomodule,boutb_fifomodule,bouta_fifomodule,boutmain_fifomodule,arst_value_fifomodule,write_flit1_vc_buffer1,norres_vc_buffer1_vc_buffer1,full_vc_buffer1,empty_vc_buffer1,error_vc_buffer1,read_flit1_vc_buffer1,locked_by_route_ff_vc_buffer1,next_locked_vc_buffer1,orres_vc_buffer1,or1res_vc_buffer1,or2res_vc_buffer1,finres1_vc_buffer1,andres1_vc_buffer1,full_vc_buffer1_not1,locked_by_route_ff_vc_buffer1_not1,thirdand_vc_buffer1,u1temp_fifomodule1,u2temp_fifomodule1,u4temp_fifomodule1,full_vc_buffer1_not1_fifomodule1,u7temp_fifomodule1,u9temp_fifomodule1,u10carry_fifomodule1,u11carry_fifomodule1,empty_vc_buffer1_not_fifomodule1,u13temp_fifomodule1,u14temp_fifomodule1,u15carry_fifomodule1,u16carry_fifomodule1,u17res_fifomodule1,u18res_fifomodule1,write_ptr_ff_fifomodule1_0_not1,write_ptr_ff_fifomodule1_1_not1,b0wire_fifomodule1,b1wire_fifomodule1,u23temp_fifomodule1_not_fifomodule1,u23temp_fifomodule1,boutb_fifomodule1,bouta_fifomodule1,boutmain_fifomodule1,arst_value_fifomodule1,write_flit2_vc_buffer2,norres_vc_buffer2_vc_buffer2,full_vc_buffer2,empty_vc_buffer2,error_vc_buffer2,read_flit2_vc_buffer2,locked_by_route_ff_vc_buffer2,next_locked_vc_buffer2,orres_vc_buffer2,or1res_vc_buffer2,or2res_vc_buffer2,finres1_vc_buffer2,andres1_vc_buffer2,full_vc_buffer2_not2,locked_by_route_ff_vc_buffer2_not2,thirdand_vc_buffer2,u1temp_fifomodule2,u2temp_fifomodule2,u4temp_fifomodule2,full_vc_buffer2_not2_fifomodule2,u7temp_fifomodule2,u9temp_fifomodule2,u10carry_fifomodule2,u11carry_fifomodule2,empty_vc_buffer2_not_fifomodule2,u13temp_fifomodule2,u14temp_fifomodule2,u15carry_fifomodule2,u16carry_fifomodule2,u17res_fifomodule2,u18res_fifomodule2,write_ptr_ff_fifomodule2_0_not2,write_ptr_ff_fifomodule2_1_not2,b0wire_fifomodule2,b1wire_fifomodule2,u23temp_fifomodule2_not_fifomodule2,u23temp_fifomodule2,boutb_fifomodule2,bouta_fifomodule2,boutmain_fifomodule2,arst_value_fifomodule2;
	wire [33:0] flit,flit1,flit2;
	wire [15:0] fifo_ff_fifomodule,fifo_ff_fifomodule1,fifo_ff_fifomodule2;
	wire [1:0] write_ptr_ff_fifomodule,read_ptr_ff_fifomodule,next_write_ptr_fifomodule,next_read_ptr_fifomodule,fifo_ocup_fifomodule,write_ptr_ff_fifomodule1,read_ptr_ff_fifomodule1,next_write_ptr_fifomodule1,next_read_ptr_fifomodule1,fifo_ocup_fifomodule1,write_ptr_ff_fifomodule2,read_ptr_ff_fifomodule2,next_write_ptr_fifomodule2,next_read_ptr_fifomodule2,fifo_ocup_fifomodule2;



	BUFX1 U00 ( .A(read_ptr_ff_fifomodule[0]), .Y(next_read_ptr_fifomodule[0]) );
	BUFX1 U01 ( .A(read_ptr_ff_fifomodule[1]), .Y(next_read_ptr_fifomodule[1]) );
	BUFX1 U02 ( .A(write_ptr_ff_fifomodule[0]), .Y(next_write_ptr_fifomodule[0]) );
	BUFX1 U03 ( .A(write_ptr_ff_fifomodule[1]), .Y(next_write_ptr_fifomodule[1]) );

	XNOR2X1 U1 ( .IN1(write_ptr_ff_fifomodule[0]), .IN2(read_ptr_ff_fifomodule[0]), .Q(u1temp_fifomodule) );
	XNOR2X1 U2 ( .IN1(write_ptr_ff_fifomodule[1]), .IN2(read_ptr_ff_fifomodule[1]), .Q(u2temp_fifomodule) );
	AND2X1 U3 ( .A(u1temp_fifomodule), .B(u2temp_fifomodule), .Y(empty_vc_buffer) );
	XOR2X1 U4 ( .A(write_ptr_ff_fifomodule[1]), .B(read_ptr_ff_fifomodule[1]), .Y(u4temp_fifomodule) );
	AND2X1 U5 ( .A(u1temp_fifomodule), .B(u4temp_fifomodule), .Y(full_vc_buffer) );
	MUX21X1 U6 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8]), .IN2(1'b0), .S(empty_vc_buffer), .Q(to_output_req_in_jump_input_datapathput_datapath[36:3][0]));
	MUX21X1 U61 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+1]), .IN2(1'b0), .S(empty_vc_buffer), .Q(to_output_req_in_jump_input_datapathput_datapath[36:3][1]));
	MUX21X1 U62 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+2]), .IN2(1'b0), .S(empty_vc_buffer), .Q(to_output_req_in_jump_input_datapathput_datapath[36:3][2]));
	MUX21X1 U63 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+3]), .IN2(1'b0), .S(empty_vc_buffer), .Q(to_output_req_in_jump_input_datapathput_datapath[36:3][3]));
	MUX21X1 U64 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+4]), .IN2(1'b0), .S(empty_vc_buffer), .Q(to_output_req_in_jump_input_datapathput_datapath[36:3][4]));
	MUX21X1 U65 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+5]), .IN2(1'b0), .S(empty_vc_buffer), .Q(to_output_req_in_jump_input_datapathput_datapath[36:3][5]));
	MUX21X1 U66 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+6]), .IN2(1'b0), .S(empty_vc_buffer), .Q(to_output_req_in_jump_input_datapathput_datapath[36:3][6]));
	MUX21X1 U67 (.IN1(fifo_ff_fifomodule[read_ptr_ff_fifomodule[0] * 8+7]), .IN2(1'b0), .S(empty_vc_buffer), .Q(to_output_req_in_jump_input_datapathput_datapath[36:3][7]));

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
	  

	DFFX2 U42 ( .CLK(u7temp_fifomodule), .D(from_input_req_in_jump_input_datapathput_datapath[36:3][0]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8]) );
	DFFX2 U43 ( .CLK(u7temp_fifomodule), .D(from_input_req_in_jump_input_datapathput_datapath[36:3][1]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+1]) );
	DFFX2 U44 ( .CLK(u7temp_fifomodule), .D(from_input_req_in_jump_input_datapathput_datapath[36:3][2]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+2]) );
	DFFX2 U45 ( .CLK(u7temp_fifomodule), .D(from_input_req_in_jump_input_datapathput_datapath[36:3][3]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+3]) );
	DFFX2 U46 ( .CLK(u7temp_fifomodule), .D(from_input_req_in_jump_input_datapathput_datapath[36:3][4]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+4]) );
	DFFX2 U47 ( .CLK(u7temp_fifomodule), .D(from_input_req_in_jump_input_datapathput_datapath[36:3][5]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+5]) );
	DFFX2 U48 ( .CLK(u7temp_fifomodule), .D(from_input_req_in_jump_input_datapathput_datapath[36:3][6]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+6]) );
	DFFX2 U49 ( .CLK(u7temp_fifomodule), .D(from_input_req_in_jump_input_datapathput_datapath[36:3][7]), .Q(fifo_ff_fifomodule[write_ptr_ff_fifomodule[0]*8+7]) );

    BUFX1 U00 ( .A(locked_by_route_ff_vc_buffer), .Y(next_locked_vc_buffer) );
    BUFX1 U0(.A(flit[0]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][0]))
	BUFX1 U1(.A(flit[1]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][1]))
	BUFX1 U2(.A(flit[2]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][2]))
	BUFX1 U3(.A(flit[3]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][3]))
	BUFX1 U4(.A(flit[4]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][4]))
	BUFX1 U5(.A(flit[5]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][5]))
	BUFX1 U6(.A(flit[6]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][6]))
	BUFX1 U7(.A(flit[7]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][7]))
	BUFX1 U8(.A(flit[8]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][8]))
	BUFX1 U9(.A(flit[9]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][9]))
	BUFX1 U10(.A(flit[10]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][10]))
	BUFX1 U11(.A(flit[11]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][11]))
	BUFX1 U12(.A(flit[12]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][12]))
	BUFX1 U13(.A(flit[13]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][13]))
	BUFX1 U14(.A(flit[14]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][14]))
	BUFX1 U15(.A(flit[15]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][15]))
	BUFX1 U16(.A(flit[16]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][16]))
	BUFX1 U17(.A(flit[17]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][17]))
	BUFX1 U18(.A(flit[18]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][18]))
	BUFX1 U19(.A(flit[19]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][19]))
	BUFX1 U20(.A(flit[20]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][20]))
	BUFX1 U21(.A(flit[21]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][21]))
	BUFX1 U22(.A(flit[22]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][22]))
	BUFX1 U23(.A(flit[23]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][23]))
	BUFX1 U24(.A(flit[24]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][24]))
	BUFX1 U25(.A(flit[25]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][25]))
	BUFX1 U26(.A(flit[26]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][26]))
	BUFX1 U27(.A(flit[27]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][27]))
	BUFX1 U28(.A(flit[28]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][28]))
	BUFX1 U29(.A(flit[29]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][29]))
	BUFX1 U30(.A(flit[30]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][30]))
	BUFX1 U31(.A(flit[31]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][31]))
	BUFX1 U32(.A(flit[32]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][32]))
	BUFX1 U33(.A(flit[33]), .Y(from_input_req_in_jump_input_datapathput_datapath[36:3][33]))
    NOR2X1 U34 ( .IN1(flit[33]), .IN2(flit[32]), .QN(norres_vc_buffer_vc_buffer) );
    OR4X1 U35 ( .IN1(flit[29]), .IN2(flit[28]), .IN3(flit[27]), .IN4(flit[26]), .Y(or1res_vc_buffer) );
    OR4X1 U35 ( .IN1(flit[25]), .IN2(flit[24]), .IN3(flit[23]), .IN4(flit[22]), .Y(or2res_vc_buffer) );
    OR2X1 U36 ( .A(or1res_vc_buffer), .B(or2res_vc_buffer), .Y(orres_vc_buffer) );
    AND3X1 U37 ( .IN1(from_input_req_in_jump_input_datapathput_datapath[0]), .IN2(norres_vc_buffer_vc_buffer), .IN3(orres_vc_buffer), .Q(finres1_vc_buffer) );
    MUX21X1 U38 (.IN1(next_locked_vc_buffer), .IN2(1'b1), .S(finres1_vc_buffer), .Q(next_locked_vc_buffer);
    AND3X1 U39 ( .IN1(from_input_req_in_jump_input_datapathput_datapath[0]), .IN2(flit[33]), .IN3(flit[32]), .Q(andres1_vc_buffer) );
    MUX21X1 U40 (.IN1(next_locked_vc_buffer), .IN2(1'b0), .S(andres1_vc_buffer), .Q(next_locked_vc_buffer);

    INVX1 U41 ( .A(full_vc_buffer), .Y(full_vc_buffer_not) );
    INVX1 U42 ( .A(locked_by_route_ff_vc_buffer), .Y(locked_by_route_ff_vc_buffer_not) );

    MUX21X1 U43 (.IN1(1'b1), .IN2(locked_by_route_ff_vc_buffer_not), .S(norres_vc_buffer_vc_buffer), .Q(thirdand_vc_buffer);
    AND3X1 U44 ( .IN1(from_input_req_in_jump_input_datapathput_datapath[0]), .IN2(full_vc_buffer_not), .IN3(thirdand_vc_buffer), .Q(write_flit_vc_buffer) );
    AND2X1 U45 ( .IN1(full_vc_buffer_not), .IN2(norres_vc_buffer_vc_buffer), .Q(from_input_resp_input_datapath[0]) );
    INVX1 U46 ( .A(empty_vc_buffer), .Y(to_output_req_in_jump_input_datapathput_datapath[0]) );
    AND2X1 U47 ( .IN1(to_output_req_in_jump_input_datapathput_datapath[0]), .IN2(to_output_resp_input_datapath[0]), .Q(read_flit_vc_buffer) );
	BUFX1 U48(.A(to_output_req_in_jump_input_datapathput_datapath[2:1]), .Y(2'b00))

	DFFX2 U49 ( .CLK(clk), .D(arst), .Q(arst_value) );
    DFFX2 U50 ( .CLK(arst), .D(arst), .Q(arst_value) );
    MUX21X1 U51 (.IN1(next_locked_vc_buffer), .IN2(1'sb0), .S(arst_value), .Q(locked_by_route_ff_vc_buffer);

	BUFX1 U00 ( .A(read_ptr_ff_fifomodule1[0]), .Y(next_read_ptr_fifomodule1[0]) );
	BUFX1 U01 ( .A(read_ptr_ff_fifomodule1[1]), .Y(next_read_ptr_fifomodule1[1]) );
	BUFX1 U02 ( .A(write_ptr_ff_fifomodule1[0]), .Y(next_write_ptr_fifomodule1[0]) );
	BUFX1 U03 ( .A(write_ptr_ff_fifomodule1[1]), .Y(next_write_ptr_fifomodule1[1]) );

	XNOR2X1 U1 ( .IN1(write_ptr_ff_fifomodule1[0]), .IN2(read_ptr_ff_fifomodule1[0]), .Q(u1temp_fifomodule1) );
	XNOR2X1 U2 ( .IN1(write_ptr_ff_fifomodule1[1]), .IN2(read_ptr_ff_fifomodule1[1]), .Q(u2temp_fifomodule1) );
	AND2X1 U3 ( .A(u1temp_fifomodule1), .B(u2temp_fifomodule1), .Y(empty_vc_buffer1) );
	XOR2X1 U4 ( .A(write_ptr_ff_fifomodule1[1]), .B(read_ptr_ff_fifomodule1[1]), .Y(u4temp_fifomodule1) );
	AND2X1 U5 ( .A(u1temp_fifomodule1), .B(u4temp_fifomodule1), .Y(full_vc_buffer1) );
	MUX21X1 U6 (.IN1(fifo_ff_fifomodule1[read_ptr_ff_fifomodule1[0] * 8]), .IN2(1'b0), .S(empty_vc_buffer1), .Q(to_output_req_in_jump_input_datapathput_datapath[73:40][0]));
	MUX21X1 U61 (.IN1(fifo_ff_fifomodule1[read_ptr_ff_fifomodule1[0] * 8+1]), .IN2(1'b0), .S(empty_vc_buffer1), .Q(to_output_req_in_jump_input_datapathput_datapath[73:40][1]));
	MUX21X1 U62 (.IN1(fifo_ff_fifomodule1[read_ptr_ff_fifomodule1[0] * 8+2]), .IN2(1'b0), .S(empty_vc_buffer1), .Q(to_output_req_in_jump_input_datapathput_datapath[73:40][2]));
	MUX21X1 U63 (.IN1(fifo_ff_fifomodule1[read_ptr_ff_fifomodule1[0] * 8+3]), .IN2(1'b0), .S(empty_vc_buffer1), .Q(to_output_req_in_jump_input_datapathput_datapath[73:40][3]));
	MUX21X1 U64 (.IN1(fifo_ff_fifomodule1[read_ptr_ff_fifomodule1[0] * 8+4]), .IN2(1'b0), .S(empty_vc_buffer1), .Q(to_output_req_in_jump_input_datapathput_datapath[73:40][4]));
	MUX21X1 U65 (.IN1(fifo_ff_fifomodule1[read_ptr_ff_fifomodule1[0] * 8+5]), .IN2(1'b0), .S(empty_vc_buffer1), .Q(to_output_req_in_jump_input_datapathput_datapath[73:40][5]));
	MUX21X1 U66 (.IN1(fifo_ff_fifomodule1[read_ptr_ff_fifomodule1[0] * 8+6]), .IN2(1'b0), .S(empty_vc_buffer1), .Q(to_output_req_in_jump_input_datapathput_datapath[73:40][6]));
	MUX21X1 U67 (.IN1(fifo_ff_fifomodule1[read_ptr_ff_fifomodule1[0] * 8+7]), .IN2(1'b0), .S(empty_vc_buffer1), .Q(to_output_req_in_jump_input_datapathput_datapath[73:40][7]));

	INVX1 U7 ( .A(full_vc_buffer1), .Y(full_vc_buffer1_not1_fifomodule1) );
	AND2X1 U8 ( .A(write_flit1_vc_buffer1), .B(full_vc_buffer1_not1_fifomodule1), .Y(u7temp_fifomodule1) );
	MUX21X1 U9 (.IN1(1'b0), .IN2(1'b1), .S(u7temp_fifomodule1), .Q(u9temp_fifomodule1));
	HADDX1 U10 ( .A0(write_ptr_ff_fifomodule1[0]), .B0(u9temp_fifomodule1), .C1(u10carry_fifomodule1), .SO(next_write_ptr_fifomodule1[0]) );
	HADDX1 U11 ( .A0(u10carry_fifomodule1), .B0(write_ptr_ff_fifomodule1[1]), .C1(u11carry_fifomodule1), .SO(next_write_ptr_fifomodule1[1]) );

	INVX1 U12 ( .A(empty_vc_buffer1), .Y(empty_vc_buffer1_not_fifomodule1) );
	AND2X1 U13 ( .A(read_flit1_vc_buffer1), .B(empty_vc_buffer1_not_fifomodule1), .Y(u13temp_fifomodule1) );
	MUX21X1 U14 (.IN1(1'b0), .IN2(1'b1), .S(u13temp_fifomodule1), .Q(u14temp_fifomodule1));
	HADDX1 U15 ( .A0(read_ptr_ff_fifomodule1[0]), .B0(u14temp_fifomodule1), .C1(u15carry_fifomodule1), .SO(next_read_ptr_fifomodule1[0]) );
	HADDX1 U16 ( .A0(u15carry_fifomodule1), .B0(read_ptr_ff_fifomodule1[1]), .C1(u16carry_fifomodule1), .SO(next_read_ptr_fifomodule1[1]) );

	AND2X1 U17 ( .A(write_flit1_vc_buffer1), .B(full_vc_buffer1), .Y(u17res_fifomodule1) );
	AND2X1 U18 ( .A(read_flit1_vc_buffer1), .B(empty_vc_buffer1), .Y(u18res_fifomodule1) );
    OR2X1 U19 ( .A(u17res_fifomodule1), .B(u18res_fifomodule1), .Y(error_vc_buffer1) );
	XOR2X1 U20 ( .A(write_ptr_ff_fifomodule1[0]), .B(read_ptr_ff_fifomodule1[0]), .Y(fifo_ocup_fifomodule1[0]) );
	INVX1 U21 ( .A(write_ptr_ff_fifomodule1[0]), .Y(write_ptr_ff_fifomodule1_0_not1) );
	AND2X1 U22 ( .A(write_ptr_ff_fifomodule1_0_not1), .B(read_ptr_ff_fifomodule1[0]), .Y(b0wire_fifomodule1) );
	XOR2X1 U23 ( .A(write_ptr_ff_fifomodule1[1]), .B(read_ptr_ff_fifomodule1[1]), .Y(u23temp_fifomodule1) );
	INVX1 U24 ( .A(write_ptr_ff_fifomodule1[1]), .Y(write_ptr_ff_fifomodule1_1_not1) );
	AND2X1 U25 ( .A(read_ptr_ff_fifomodule1[1]), .B(write_ptr_ff_fifomodule1_1_not1), .Y(boutb_fifomodule1) );
	XOR2X1 U24 ( .A(u23temp_fifomodule1), .B(b0wire_fifomodule1), .Y(fifo_ocup_fifomodule1[1]) );
	INVX1 U25 ( .A(u23temp_fifomodule1), .Y(u23temp_fifomodule1_not_fifomodule1) );
	AND2X1 U26 ( .A(b0wire_fifomodule1), .B(u23temp_fifomodule1_not_fifomodule1), .Y(bouta_fifomodule1) );
	OR2X1 U27 ( .A(bouta_fifomodule1), .B(boutb_fifomodule1), .Y(boutmain_fifomodule1) );
	DFFX2 U28 ( .CLK(clk), .D(fifo_ocup_fifomodule1[0]), .Q(ocup_o[0]) );
	DFFX2 U29 ( .CLK(clk), .D(fifo_ocup_fifomodule1[1]), .Q(ocup_o[1]) );
	DFFX2 U30 ( .CLK(clk), .D(arst), .Q(arst_value_fifomodule1) );
	DFFX2 U31 ( .CLK(arst), .D(arst), .Q(arst_value_fifomodule1) );
	DFFX2 U32 ( .CLK(arst_value_fifomodule1), .D(1'b0), .Q(write_ptr_ff_fifomodule1[0]) );
	DFFX2 U33 ( .CLK(arst_value_fifomodule1), .D(1'b0), .Q(read_ptr_ff_fifomodule1[0]) );
	DFFX2 U34 ( .CLK(arst_value_fifomodule1), .D(1'b0), .Q(fifo_ff_fifomodule1[0]) );
	DFFX2 U35 ( .CLK(arst_value_fifomodule1), .D(1'b0), .Q(write_ptr_ff_fifomodule1[1]) );
	DFFX2 U36 ( .CLK(arst_value_fifomodule1), .D(1'b0), .Q(read_ptr_ff_fifomodule1[1]) );
	DFFX2 U37 ( .CLK(arst_value_fifomodule1), .D(1'b0), .Q(fifo_ff_fifomodule1[1]) );

	DFFX2 U38 ( .CLK(clk), .D(next_write_ptr_fifomodule1[0]), .Q(write_ptr_ff_fifomodule1[0]) );
	DFFX2 U39 ( .CLK(clk), .D(next_write_ptr_fifomodule1[1]), .Q(write_ptr_ff_fifomodule1[1]) );
	DFFX2 U40 ( .CLK(clk), .D(next_read_ptr_fifomodule1[0]), .Q(read_ptr_ff_fifomodule1[0]) );
	DFFX2 U41 ( .CLK(clk), .D(next_read_ptr_fifomodule1[1]), .Q(read_ptr_ff_fifomodule1[1]) );
	  

	DFFX2 U42 ( .CLK(u7temp_fifomodule1), .D(from_input_req_in_jump_input_datapathput_datapath[73:40][0]), .Q(fifo_ff_fifomodule1[write_ptr_ff_fifomodule1[0]*8]) );
	DFFX2 U43 ( .CLK(u7temp_fifomodule1), .D(from_input_req_in_jump_input_datapathput_datapath[73:40][1]), .Q(fifo_ff_fifomodule1[write_ptr_ff_fifomodule1[0]*8+1]) );
	DFFX2 U44 ( .CLK(u7temp_fifomodule1), .D(from_input_req_in_jump_input_datapathput_datapath[73:40][2]), .Q(fifo_ff_fifomodule1[write_ptr_ff_fifomodule1[0]*8+2]) );
	DFFX2 U45 ( .CLK(u7temp_fifomodule1), .D(from_input_req_in_jump_input_datapathput_datapath[73:40][3]), .Q(fifo_ff_fifomodule1[write_ptr_ff_fifomodule1[0]*8+3]) );
	DFFX2 U46 ( .CLK(u7temp_fifomodule1), .D(from_input_req_in_jump_input_datapathput_datapath[73:40][4]), .Q(fifo_ff_fifomodule1[write_ptr_ff_fifomodule1[0]*8+4]) );
	DFFX2 U47 ( .CLK(u7temp_fifomodule1), .D(from_input_req_in_jump_input_datapathput_datapath[73:40][5]), .Q(fifo_ff_fifomodule1[write_ptr_ff_fifomodule1[0]*8+5]) );
	DFFX2 U48 ( .CLK(u7temp_fifomodule1), .D(from_input_req_in_jump_input_datapathput_datapath[73:40][6]), .Q(fifo_ff_fifomodule1[write_ptr_ff_fifomodule1[0]*8+6]) );
	DFFX2 U49 ( .CLK(u7temp_fifomodule1), .D(from_input_req_in_jump_input_datapathput_datapath[73:40][7]), .Q(fifo_ff_fifomodule1[write_ptr_ff_fifomodule1[0]*8+7]) );

    BUFX1 U00 ( .A(locked_by_route_ff_vc_buffer1), .Y(next_locked_vc_buffer1) );
    BUFX1 U0(.A(flit1[0]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][0]))
	BUFX1 U1(.A(flit1[1]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][1]))
	BUFX1 U2(.A(flit1[2]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][2]))
	BUFX1 U3(.A(flit1[3]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][3]))
	BUFX1 U4(.A(flit1[4]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][4]))
	BUFX1 U5(.A(flit1[5]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][5]))
	BUFX1 U6(.A(flit1[6]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][6]))
	BUFX1 U7(.A(flit1[7]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][7]))
	BUFX1 U8(.A(flit1[8]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][8]))
	BUFX1 U9(.A(flit1[9]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][9]))
	BUFX1 U10(.A(flit1[10]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][10]))
	BUFX1 U11(.A(flit1[11]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][11]))
	BUFX1 U12(.A(flit1[12]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][12]))
	BUFX1 U13(.A(flit1[13]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][13]))
	BUFX1 U14(.A(flit1[14]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][14]))
	BUFX1 U15(.A(flit1[15]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][15]))
	BUFX1 U16(.A(flit1[16]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][16]))
	BUFX1 U17(.A(flit1[17]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][17]))
	BUFX1 U18(.A(flit1[18]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][18]))
	BUFX1 U19(.A(flit1[19]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][19]))
	BUFX1 U20(.A(flit1[20]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][20]))
	BUFX1 U21(.A(flit1[21]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][21]))
	BUFX1 U22(.A(flit1[22]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][22]))
	BUFX1 U23(.A(flit1[23]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][23]))
	BUFX1 U24(.A(flit1[24]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][24]))
	BUFX1 U25(.A(flit1[25]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][25]))
	BUFX1 U26(.A(flit1[26]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][26]))
	BUFX1 U27(.A(flit1[27]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][27]))
	BUFX1 U28(.A(flit1[28]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][28]))
	BUFX1 U29(.A(flit1[29]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][29]))
	BUFX1 U30(.A(flit1[30]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][30]))
	BUFX1 U31(.A(flit1[31]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][31]))
	BUFX1 U32(.A(flit1[32]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][32]))
	BUFX1 U33(.A(flit1[33]), .Y(from_input_req_in_jump_input_datapathput_datapath[73:40][33]))
    NOR2X1 U34 ( .IN1(flit1[33]), .IN2(flit1[32]), .QN(norres_vc_buffer1_vc_buffer1) );
    OR4X1 U35 ( .IN1(flit1[29]), .IN2(flit1[28]), .IN3(flit1[27]), .IN4(flit1[26]), .Y(or1res_vc_buffer1) );
    OR4X1 U35 ( .IN1(flit1[25]), .IN2(flit1[24]), .IN3(flit1[23]), .IN4(flit1[22]), .Y(or2res_vc_buffer1) );
    OR2X1 U36 ( .A(or1res_vc_buffer1), .B(or2res_vc_buffer1), .Y(orres_vc_buffer1) );
    AND3X1 U37 ( .IN1(from_input_req_in_jump_input_datapathput_datapath[37]), .IN2(norres_vc_buffer1_vc_buffer1), .IN3(orres_vc_buffer1), .Q(finres1_vc_buffer1) );
    MUX21X1 U38 (.IN1(next_locked_vc_buffer1), .IN2(1'b1), .S(finres1_vc_buffer1), .Q(next_locked_vc_buffer1);
    AND3X1 U39 ( .IN1(from_input_req_in_jump_input_datapathput_datapath[37]), .IN2(flit1[33]), .IN3(flit1[32]), .Q(andres1_vc_buffer1) );
    MUX21X1 U40 (.IN1(next_locked_vc_buffer1), .IN2(1'b0), .S(andres1_vc_buffer1), .Q(next_locked_vc_buffer1);

    INVX1 U41 ( .A(full_vc_buffer1), .Y(full_vc_buffer1_not1) );
    INVX1 U42 ( .A(locked_by_route_ff_vc_buffer1), .Y(locked_by_route_ff_vc_buffer1_not1) );

    MUX21X1 U43 (.IN1(1'b1), .IN2(locked_by_route_ff_vc_buffer1_not1), .S(norres_vc_buffer1_vc_buffer1), .Q(thirdand_vc_buffer1);
    AND3X1 U44 ( .IN1(from_input_req_in_jump_input_datapathput_datapath[37]), .IN2(full_vc_buffer1_not1), .IN3(thirdand_vc_buffer1), .Q(write_flit1_vc_buffer1) );
    AND2X1 U45 ( .IN1(full_vc_buffer1_not1), .IN2(norres_vc_buffer1_vc_buffer1), .Q(from_input_resp_input_datapath[1]) );
    INVX1 U46 ( .A(empty_vc_buffer1), .Y(to_output_req_in_jump_input_datapathput_datapath[37]) );
    AND2X1 U47 ( .IN1(to_output_req_in_jump_input_datapathput_datapath[37]), .IN2(to_output_resp_input_datapath[1]), .Q(read_flit1_vc_buffer1) );
	BUFX1 U48(.A(to_output_req_in_jump_input_datapathput_datapath[39:38]), .Y(2'b01))

	DFFX2 U49 ( .CLK(clk), .D(arst), .Q(arst_value) );
    DFFX2 U50 ( .CLK(arst), .D(arst), .Q(arst_value) );
    MUX21X1 U51 (.IN1(next_locked_vc_buffer1), .IN2(1'sb0), .S(arst_value), .Q(locked_by_route_ff_vc_buffer1);


	BUFX1 U00 ( .A(read_ptr_ff_fifomodule2[0]), .Y(next_read_ptr_fifomodule2[0]) );
	BUFX1 U01 ( .A(read_ptr_ff_fifomodule2[1]), .Y(next_read_ptr_fifomodule2[1]) );
	BUFX1 U02 ( .A(write_ptr_ff_fifomodule2[0]), .Y(next_write_ptr_fifomodule2[0]) );
	BUFX1 U03 ( .A(write_ptr_ff_fifomodule2[1]), .Y(next_write_ptr_fifomodule2[1]) );

	XNOR2X1 U1 ( .IN1(write_ptr_ff_fifomodule2[0]), .IN2(read_ptr_ff_fifomodule2[0]), .Q(u1temp_fifomodule2) );
	XNOR2X1 U2 ( .IN1(write_ptr_ff_fifomodule2[1]), .IN2(read_ptr_ff_fifomodule2[1]), .Q(u2temp_fifomodule2) );
	AND2X1 U3 ( .A(u1temp_fifomodule2), .B(u2temp_fifomodule2), .Y(empty_vc_buffer2) );
	XOR2X1 U4 ( .A(write_ptr_ff_fifomodule2[1]), .B(read_ptr_ff_fifomodule2[1]), .Y(u4temp_fifomodule2) );
	AND2X1 U5 ( .A(u1temp_fifomodule2), .B(u4temp_fifomodule2), .Y(full_vc_buffer2) );
	MUX21X1 U6 (.IN1(fifo_ff_fifomodule2[read_ptr_ff_fifomodule2[0] * 8]), .IN2(1'b0), .S(empty_vc_buffer2), .Q(to_output_req_in_jump_input_datapathput_datapath[110:77][0]));
	MUX21X1 U61 (.IN1(fifo_ff_fifomodule2[read_ptr_ff_fifomodule2[0] * 8+1]), .IN2(1'b0), .S(empty_vc_buffer2), .Q(to_output_req_in_jump_input_datapathput_datapath[110:77][1]));
	MUX21X1 U62 (.IN1(fifo_ff_fifomodule2[read_ptr_ff_fifomodule2[0] * 8+2]), .IN2(1'b0), .S(empty_vc_buffer2), .Q(to_output_req_in_jump_input_datapathput_datapath[110:77][2]));
	MUX21X1 U63 (.IN1(fifo_ff_fifomodule2[read_ptr_ff_fifomodule2[0] * 8+3]), .IN2(1'b0), .S(empty_vc_buffer2), .Q(to_output_req_in_jump_input_datapathput_datapath[110:77][3]));
	MUX21X1 U64 (.IN1(fifo_ff_fifomodule2[read_ptr_ff_fifomodule2[0] * 8+4]), .IN2(1'b0), .S(empty_vc_buffer2), .Q(to_output_req_in_jump_input_datapathput_datapath[110:77][4]));
	MUX21X1 U65 (.IN1(fifo_ff_fifomodule2[read_ptr_ff_fifomodule2[0] * 8+5]), .IN2(1'b0), .S(empty_vc_buffer2), .Q(to_output_req_in_jump_input_datapathput_datapath[110:77][5]));
	MUX21X1 U66 (.IN1(fifo_ff_fifomodule2[read_ptr_ff_fifomodule2[0] * 8+6]), .IN2(1'b0), .S(empty_vc_buffer2), .Q(to_output_req_in_jump_input_datapathput_datapath[110:77][6]));
	MUX21X1 U67 (.IN1(fifo_ff_fifomodule2[read_ptr_ff_fifomodule2[0] * 8+7]), .IN2(1'b0), .S(empty_vc_buffer2), .Q(to_output_req_in_jump_input_datapathput_datapath[110:77][7]));

	INVX1 U7 ( .A(full_vc_buffer2), .Y(full_vc_buffer2_not2_fifomodule2) );
	AND2X1 U8 ( .A(write_flit2_vc_buffer2), .B(full_vc_buffer2_not2_fifomodule2), .Y(u7temp_fifomodule2) );
	MUX21X1 U9 (.IN1(1'b0), .IN2(1'b1), .S(u7temp_fifomodule2), .Q(u9temp_fifomodule2));
	HADDX1 U10 ( .A0(write_ptr_ff_fifomodule2[0]), .B0(u9temp_fifomodule2), .C1(u10carry_fifomodule2), .SO(next_write_ptr_fifomodule2[0]) );
	HADDX1 U11 ( .A0(u10carry_fifomodule2), .B0(write_ptr_ff_fifomodule2[1]), .C1(u11carry_fifomodule2), .SO(next_write_ptr_fifomodule2[1]) );

	INVX1 U12 ( .A(empty_vc_buffer2), .Y(empty_vc_buffer2_not_fifomodule2) );
	AND2X1 U13 ( .A(read_flit2_vc_buffer2), .B(empty_vc_buffer2_not_fifomodule2), .Y(u13temp_fifomodule2) );
	MUX21X1 U14 (.IN1(1'b0), .IN2(1'b1), .S(u13temp_fifomodule2), .Q(u14temp_fifomodule2));
	HADDX1 U15 ( .A0(read_ptr_ff_fifomodule2[0]), .B0(u14temp_fifomodule2), .C1(u15carry_fifomodule2), .SO(next_read_ptr_fifomodule2[0]) );
	HADDX1 U16 ( .A0(u15carry_fifomodule2), .B0(read_ptr_ff_fifomodule2[1]), .C1(u16carry_fifomodule2), .SO(next_read_ptr_fifomodule2[1]) );

	AND2X1 U17 ( .A(write_flit2_vc_buffer2), .B(full_vc_buffer2), .Y(u17res_fifomodule2) );
	AND2X1 U18 ( .A(read_flit2_vc_buffer2), .B(empty_vc_buffer2), .Y(u18res_fifomodule2) );
    OR2X1 U19 ( .A(u17res_fifomodule2), .B(u18res_fifomodule2), .Y(error_vc_buffer2) );
	XOR2X1 U20 ( .A(write_ptr_ff_fifomodule2[0]), .B(read_ptr_ff_fifomodule2[0]), .Y(fifo_ocup_fifomodule2[0]) );
	INVX1 U21 ( .A(write_ptr_ff_fifomodule2[0]), .Y(write_ptr_ff_fifomodule2_0_not2) );
	AND2X1 U22 ( .A(write_ptr_ff_fifomodule2_0_not2), .B(read_ptr_ff_fifomodule2[0]), .Y(b0wire_fifomodule2) );
	XOR2X1 U23 ( .A(write_ptr_ff_fifomodule2[1]), .B(read_ptr_ff_fifomodule2[1]), .Y(u23temp_fifomodule2) );
	INVX1 U24 ( .A(write_ptr_ff_fifomodule2[1]), .Y(write_ptr_ff_fifomodule2_1_not2) );
	AND2X1 U25 ( .A(read_ptr_ff_fifomodule2[1]), .B(write_ptr_ff_fifomodule2_1_not2), .Y(boutb_fifomodule2) );
	XOR2X1 U24 ( .A(u23temp_fifomodule2), .B(b0wire_fifomodule2), .Y(fifo_ocup_fifomodule2[1]) );
	INVX1 U25 ( .A(u23temp_fifomodule2), .Y(u23temp_fifomodule2_not_fifomodule2) );
	AND2X1 U26 ( .A(b0wire_fifomodule2), .B(u23temp_fifomodule2_not_fifomodule2), .Y(bouta_fifomodule2) );
	OR2X1 U27 ( .A(bouta_fifomodule2), .B(boutb_fifomodule2), .Y(boutmain_fifomodule2) );
	DFFX2 U28 ( .CLK(clk), .D(fifo_ocup_fifomodule2[0]), .Q(ocup_o[0]) );
	DFFX2 U29 ( .CLK(clk), .D(fifo_ocup_fifomodule2[1]), .Q(ocup_o[1]) );
	DFFX2 U30 ( .CLK(clk), .D(arst), .Q(arst_value_fifomodule2) );
	DFFX2 U31 ( .CLK(arst), .D(arst), .Q(arst_value_fifomodule2) );
	DFFX2 U32 ( .CLK(arst_value_fifomodule2), .D(1'b0), .Q(write_ptr_ff_fifomodule2[0]) );
	DFFX2 U33 ( .CLK(arst_value_fifomodule2), .D(1'b0), .Q(read_ptr_ff_fifomodule2[0]) );
	DFFX2 U34 ( .CLK(arst_value_fifomodule2), .D(1'b0), .Q(fifo_ff_fifomodule2[0]) );
	DFFX2 U35 ( .CLK(arst_value_fifomodule2), .D(1'b0), .Q(write_ptr_ff_fifomodule2[1]) );
	DFFX2 U36 ( .CLK(arst_value_fifomodule2), .D(1'b0), .Q(read_ptr_ff_fifomodule2[1]) );
	DFFX2 U37 ( .CLK(arst_value_fifomodule2), .D(1'b0), .Q(fifo_ff_fifomodule2[1]) );

	DFFX2 U38 ( .CLK(clk), .D(next_write_ptr_fifomodule2[0]), .Q(write_ptr_ff_fifomodule2[0]) );
	DFFX2 U39 ( .CLK(clk), .D(next_write_ptr_fifomodule2[1]), .Q(write_ptr_ff_fifomodule2[1]) );
	DFFX2 U40 ( .CLK(clk), .D(next_read_ptr_fifomodule2[0]), .Q(read_ptr_ff_fifomodule2[0]) );
	DFFX2 U41 ( .CLK(clk), .D(next_read_ptr_fifomodule2[1]), .Q(read_ptr_ff_fifomodule2[1]) );
	  

	DFFX2 U42 ( .CLK(u7temp_fifomodule2), .D(from_input_req_in_jump_input_datapathput_datapath[110:77][0]), .Q(fifo_ff_fifomodule2[write_ptr_ff_fifomodule2[0]*8]) );
	DFFX2 U43 ( .CLK(u7temp_fifomodule2), .D(from_input_req_in_jump_input_datapathput_datapath[110:77][1]), .Q(fifo_ff_fifomodule2[write_ptr_ff_fifomodule2[0]*8+1]) );
	DFFX2 U44 ( .CLK(u7temp_fifomodule2), .D(from_input_req_in_jump_input_datapathput_datapath[110:77][2]), .Q(fifo_ff_fifomodule2[write_ptr_ff_fifomodule2[0]*8+2]) );
	DFFX2 U45 ( .CLK(u7temp_fifomodule2), .D(from_input_req_in_jump_input_datapathput_datapath[110:77][3]), .Q(fifo_ff_fifomodule2[write_ptr_ff_fifomodule2[0]*8+3]) );
	DFFX2 U46 ( .CLK(u7temp_fifomodule2), .D(from_input_req_in_jump_input_datapathput_datapath[110:77][4]), .Q(fifo_ff_fifomodule2[write_ptr_ff_fifomodule2[0]*8+4]) );
	DFFX2 U47 ( .CLK(u7temp_fifomodule2), .D(from_input_req_in_jump_input_datapathput_datapath[110:77][5]), .Q(fifo_ff_fifomodule2[write_ptr_ff_fifomodule2[0]*8+5]) );
	DFFX2 U48 ( .CLK(u7temp_fifomodule2), .D(from_input_req_in_jump_input_datapathput_datapath[110:77][6]), .Q(fifo_ff_fifomodule2[write_ptr_ff_fifomodule2[0]*8+6]) );
	DFFX2 U49 ( .CLK(u7temp_fifomodule2), .D(from_input_req_in_jump_input_datapathput_datapath[110:77][7]), .Q(fifo_ff_fifomodule2[write_ptr_ff_fifomodule2[0]*8+7]) );

    BUFX1 U00 ( .A(locked_by_route_ff_vc_buffer2), .Y(next_locked_vc_buffer2) );
    BUFX1 U0(.A(flit2[0]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][0]))
	BUFX1 U1(.A(flit2[1]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][1]))
	BUFX1 U2(.A(flit2[2]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][2]))
	BUFX1 U3(.A(flit2[3]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][3]))
	BUFX1 U4(.A(flit2[4]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][4]))
	BUFX1 U5(.A(flit2[5]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][5]))
	BUFX1 U6(.A(flit2[6]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][6]))
	BUFX1 U7(.A(flit2[7]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][7]))
	BUFX1 U8(.A(flit2[8]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][8]))
	BUFX1 U9(.A(flit2[9]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][9]))
	BUFX1 U10(.A(flit2[10]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][10]))
	BUFX1 U11(.A(flit2[11]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][11]))
	BUFX1 U12(.A(flit2[12]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][12]))
	BUFX1 U13(.A(flit2[13]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][13]))
	BUFX1 U14(.A(flit2[14]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][14]))
	BUFX1 U15(.A(flit2[15]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][15]))
	BUFX1 U16(.A(flit2[16]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][16]))
	BUFX1 U17(.A(flit2[17]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][17]))
	BUFX1 U18(.A(flit2[18]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][18]))
	BUFX1 U19(.A(flit2[19]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][19]))
	BUFX1 U20(.A(flit2[20]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][20]))
	BUFX1 U21(.A(flit2[21]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][21]))
	BUFX1 U22(.A(flit2[22]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][22]))
	BUFX1 U23(.A(flit2[23]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][23]))
	BUFX1 U24(.A(flit2[24]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][24]))
	BUFX1 U25(.A(flit2[25]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][25]))
	BUFX1 U26(.A(flit2[26]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][26]))
	BUFX1 U27(.A(flit2[27]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][27]))
	BUFX1 U28(.A(flit2[28]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][28]))
	BUFX1 U29(.A(flit2[29]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][29]))
	BUFX1 U30(.A(flit2[30]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][30]))
	BUFX1 U31(.A(flit2[31]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][31]))
	BUFX1 U32(.A(flit2[32]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][32]))
	BUFX1 U33(.A(flit2[33]), .Y(from_input_req_in_jump_input_datapathput_datapath[110:77][33]))
    NOR2X1 U34 ( .IN1(flit2[33]), .IN2(flit2[32]), .QN(norres_vc_buffer2_vc_buffer2) );
    OR4X1 U35 ( .IN1(flit2[29]), .IN2(flit2[28]), .IN3(flit2[27]), .IN4(flit2[26]), .Y(or1res_vc_buffer2) );
    OR4X1 U35 ( .IN1(flit2[25]), .IN2(flit2[24]), .IN3(flit2[23]), .IN4(flit2[22]), .Y(or2res_vc_buffer2) );
    OR2X1 U36 ( .A(or1res_vc_buffer2), .B(or2res_vc_buffer2), .Y(orres_vc_buffer2) );
    AND3X1 U37 ( .IN1(from_input_req_in_jump_input_datapathput_datapath[74]), .IN2(norres_vc_buffer2_vc_buffer2), .IN3(orres_vc_buffer2), .Q(finres1_vc_buffer2) );
    MUX21X1 U38 (.IN1(next_locked_vc_buffer2), .IN2(1'b1), .S(finres1_vc_buffer2), .Q(next_locked_vc_buffer2);
    AND3X1 U39 ( .IN1(from_input_req_in_jump_input_datapathput_datapath[74]), .IN2(flit2[33]), .IN3(flit2[32]), .Q(andres1_vc_buffer2) );
    MUX21X1 U40 (.IN1(next_locked_vc_buffer2), .IN2(1'b0), .S(andres1_vc_buffer2), .Q(next_locked_vc_buffer2);

    INVX1 U41 ( .A(full_vc_buffer2), .Y(full_vc_buffer2_not2) );
    INVX1 U42 ( .A(locked_by_route_ff_vc_buffer2), .Y(locked_by_route_ff_vc_buffer2_not2) );

    MUX21X1 U43 (.IN1(1'b1), .IN2(locked_by_route_ff_vc_buffer2_not2), .S(norres_vc_buffer2_vc_buffer2), .Q(thirdand_vc_buffer2);
    AND3X1 U44 ( .IN1(from_input_req_in_jump_input_datapathput_datapath[74]), .IN2(full_vc_buffer2_not2), .IN3(thirdand_vc_buffer2), .Q(write_flit2_vc_buffer2) );
    AND2X1 U45 ( .IN1(full_vc_buffer2_not2), .IN2(norres_vc_buffer2_vc_buffer2), .Q(from_input_resp_input_datapath[2]) );
    INVX1 U46 ( .A(empty_vc_buffer2), .Y(to_output_req_in_jump_input_datapathput_datapath[74]) );
    AND2X1 U47 ( .IN1(to_output_req_in_jump_input_datapathput_datapath[74]), .IN2(to_output_resp_input_datapath[2]), .Q(read_flit2_vc_buffer2) );
	BUFX1 U48(.A(to_output_req_in_jump_input_datapathput_datapath[76:75]), .Y(2'b10))

	DFFX2 U49 ( .CLK(clk), .D(arst), .Q(arst_value) );
    DFFX2 U50 ( .CLK(arst), .D(arst), .Q(arst_value) );
    MUX21X1 U51 (.IN1(next_locked_vc_buffer2), .IN2(1'sb0), .S(arst_value), .Q(locked_by_route_ff_vc_buffer2);

	BUFX1 U3(.A(from_input_req_in_jump_input_datapathput_datapath[77]), .Y(fin_req_i[3]))
	BUFX1 U4(.A(from_input_req_in_jump_input_datapathput_datapath[78]), .Y(fin_req_i[4]))
	BUFX1 U5(.A(from_input_req_in_jump_input_datapathput_datapath[79]), .Y(fin_req_i[5]))
	BUFX1 U6(.A(from_input_req_in_jump_input_datapathput_datapath[80]), .Y(fin_req_i[6]))
	BUFX1 U7(.A(from_input_req_in_jump_input_datapathput_datapath[81]), .Y(fin_req_i[7]))
	BUFX1 U8(.A(from_input_req_in_jump_input_datapathput_datapath[82]), .Y(fin_req_i[8]))
	BUFX1 U9(.A(from_input_req_in_jump_input_datapathput_datapath[83]), .Y(fin_req_i[9]))
	BUFX1 U10(.A(from_input_req_in_jump_input_datapathput_datapath[84]), .Y(fin_req_i[10]))
	BUFX1 U11(.A(from_input_req_in_jump_input_datapathput_datapath[85]), .Y(fin_req_i[11]))
	BUFX1 U12(.A(from_input_req_in_jump_input_datapathput_datapath[86]), .Y(fin_req_i[12]))
	BUFX1 U13(.A(from_input_req_in_jump_input_datapathput_datapath[87]), .Y(fin_req_i[13]))
	BUFX1 U14(.A(from_input_req_in_jump_input_datapathput_datapath[88]), .Y(fin_req_i[14]))
	BUFX1 U15(.A(from_input_req_in_jump_input_datapathput_datapath[89]), .Y(fin_req_i[15]))
	BUFX1 U16(.A(from_input_req_in_jump_input_datapathput_datapath[90]), .Y(fin_req_i[16]))
	BUFX1 U17(.A(from_input_req_in_jump_input_datapathput_datapath[91]), .Y(fin_req_i[17]))
	BUFX1 U18(.A(from_input_req_in_jump_input_datapathput_datapath[92]), .Y(fin_req_i[18]))
	BUFX1 U19(.A(from_input_req_in_jump_input_datapathput_datapath[93]), .Y(fin_req_i[19]))
	BUFX1 U20(.A(from_input_req_in_jump_input_datapathput_datapath[94]), .Y(fin_req_i[20]))
	BUFX1 U21(.A(from_input_req_in_jump_input_datapathput_datapath[95]), .Y(fin_req_i[21]))
	BUFX1 U22(.A(from_input_req_in_jump_input_datapathput_datapath[96]), .Y(fin_req_i[22]))
	BUFX1 U23(.A(from_input_req_in_jump_input_datapathput_datapath[97]), .Y(fin_req_i[23]))
	BUFX1 U24(.A(from_input_req_in_jump_input_datapathput_datapath[98]), .Y(fin_req_i[24]))
	BUFX1 U25(.A(from_input_req_in_jump_input_datapathput_datapath[99]), .Y(fin_req_i[25]))
	BUFX1 U26(.A(from_input_req_in_jump_input_datapathput_datapath[100]), .Y(fin_req_i[26]))
	BUFX1 U27(.A(from_input_req_in_jump_input_datapathput_datapath[101]), .Y(fin_req_i[27]))
	BUFX1 U28(.A(from_input_req_in_jump_input_datapathput_datapath[102]), .Y(fin_req_i[28]))
	BUFX1 U29(.A(from_input_req_in_jump_input_datapathput_datapath[103]), .Y(fin_req_i[29]))
	BUFX1 U30(.A(from_input_req_in_jump_input_datapathput_datapath[104]), .Y(fin_req_i[30]))
	BUFX1 U31(.A(from_input_req_in_jump_input_datapathput_datapath[105]), .Y(fin_req_i[31]))
	BUFX1 U32(.A(from_input_req_in_jump_input_datapathput_datapath[106]), .Y(fin_req_i[32]))
	BUFX1 U33(.A(from_input_req_in_jump_input_datapathput_datapath[107]), .Y(fin_req_i[33]))
	BUFX1 U34(.A(from_input_req_in_jump_input_datapathput_datapath[108]), .Y(fin_req_i[34]))
	BUFX1 U35(.A(from_input_req_in_jump_input_datapathput_datapath[109]), .Y(fin_req_i[35]))
	BUFX1 U36(.A(from_input_req_in_jump_input_datapathput_datapath[110]), .Y(fin_req_i[36]))
    XNOR2X1 U222 ( .IN1(fin_req_i[1]), .IN2(i[0]), .QN(xnor1resu_input_datapath) );
    XNOR2X1 U222 ( .IN1(fin_req_i[2]), .IN2(i[1]), .QN(xnor2resu_input_datapath) );
    AND2X1 U128 ( .IN1(xnor1resu_input_datapath), .IN2(xnor2resu_input_datapath), .Q(and1resu_input_datapath) );
    AND3X1 U128 ( .IN1(and1resu_input_datapath), .IN2(fin_req_i[0]), .IN2(fin_req_i[0]), .Q(cond1line_input_datapath) );
    MUX21X1 U0009 (.IN1(vc_ch_act_in_input_datapath[0]), .IN2(i[0]), .S(cond1line_input_datapath), .Q(vc_ch_act_in_input_datapath[0]));
    MUX21X1 U0010 (.IN1(vc_ch_act_in_input_datapath[1]), .IN2(i[1]), .S(cond1line_input_datapath), .Q(vc_ch_act_in_input_datapath[1]));
    MUX21X1 U0011 (.IN1(req_in_jump_input_datapath), .IN2(1), .S(cond1line_input_datapath), .Q(req_in_jump_input_datapath));
	BUFX1 U3(.A(from_input_req_in_jump_input_datapathput_datapath[40]), .Y(fin_req_i[3]))
	BUFX1 U4(.A(from_input_req_in_jump_input_datapathput_datapath[41]), .Y(fin_req_i[4]))
	BUFX1 U5(.A(from_input_req_in_jump_input_datapathput_datapath[42]), .Y(fin_req_i[5]))
	BUFX1 U6(.A(from_input_req_in_jump_input_datapathput_datapath[43]), .Y(fin_req_i[6]))
	BUFX1 U7(.A(from_input_req_in_jump_input_datapathput_datapath[44]), .Y(fin_req_i[7]))
	BUFX1 U8(.A(from_input_req_in_jump_input_datapathput_datapath[45]), .Y(fin_req_i[8]))
	BUFX1 U9(.A(from_input_req_in_jump_input_datapathput_datapath[46]), .Y(fin_req_i[9]))
	BUFX1 U10(.A(from_input_req_in_jump_input_datapathput_datapath[47]), .Y(fin_req_i[10]))
	BUFX1 U11(.A(from_input_req_in_jump_input_datapathput_datapath[48]), .Y(fin_req_i[11]))
	BUFX1 U12(.A(from_input_req_in_jump_input_datapathput_datapath[49]), .Y(fin_req_i[12]))
	BUFX1 U13(.A(from_input_req_in_jump_input_datapathput_datapath[50]), .Y(fin_req_i[13]))
	BUFX1 U14(.A(from_input_req_in_jump_input_datapathput_datapath[51]), .Y(fin_req_i[14]))
	BUFX1 U15(.A(from_input_req_in_jump_input_datapathput_datapath[52]), .Y(fin_req_i[15]))
	BUFX1 U16(.A(from_input_req_in_jump_input_datapathput_datapath[53]), .Y(fin_req_i[16]))
	BUFX1 U17(.A(from_input_req_in_jump_input_datapathput_datapath[54]), .Y(fin_req_i[17]))
	BUFX1 U18(.A(from_input_req_in_jump_input_datapathput_datapath[55]), .Y(fin_req_i[18]))
	BUFX1 U19(.A(from_input_req_in_jump_input_datapathput_datapath[56]), .Y(fin_req_i[19]))
	BUFX1 U20(.A(from_input_req_in_jump_input_datapathput_datapath[57]), .Y(fin_req_i[20]))
	BUFX1 U21(.A(from_input_req_in_jump_input_datapathput_datapath[58]), .Y(fin_req_i[21]))
	BUFX1 U22(.A(from_input_req_in_jump_input_datapathput_datapath[59]), .Y(fin_req_i[22]))
	BUFX1 U23(.A(from_input_req_in_jump_input_datapathput_datapath[60]), .Y(fin_req_i[23]))
	BUFX1 U24(.A(from_input_req_in_jump_input_datapathput_datapath[61]), .Y(fin_req_i[24]))
	BUFX1 U25(.A(from_input_req_in_jump_input_datapathput_datapath[62]), .Y(fin_req_i[25]))
	BUFX1 U26(.A(from_input_req_in_jump_input_datapathput_datapath[63]), .Y(fin_req_i[26]))
	BUFX1 U27(.A(from_input_req_in_jump_input_datapathput_datapath[64]), .Y(fin_req_i[27]))
	BUFX1 U28(.A(from_input_req_in_jump_input_datapathput_datapath[65]), .Y(fin_req_i[28]))
	BUFX1 U29(.A(from_input_req_in_jump_input_datapathput_datapath[66]), .Y(fin_req_i[29]))
	BUFX1 U30(.A(from_input_req_in_jump_input_datapathput_datapath[67]), .Y(fin_req_i[30]))
	BUFX1 U31(.A(from_input_req_in_jump_input_datapathput_datapath[68]), .Y(fin_req_i[31]))
	BUFX1 U32(.A(from_input_req_in_jump_input_datapathput_datapath[69]), .Y(fin_req_i[32]))
	BUFX1 U33(.A(from_input_req_in_jump_input_datapathput_datapath[70]), .Y(fin_req_i[33]))
	BUFX1 U34(.A(from_input_req_in_jump_input_datapathput_datapath[71]), .Y(fin_req_i[34]))
	BUFX1 U35(.A(from_input_req_in_jump_input_datapathput_datapath[72]), .Y(fin_req_i[35]))
	BUFX1 U36(.A(from_input_req_in_jump_input_datapathput_datapath[73]), .Y(fin_req_i[36]))

	BUFX1 U3(.A(from_input_req_in_jump_input_datapathput_datapath[3]), .Y(fin_req_i[3]))
	BUFX1 U4(.A(from_input_req_in_jump_input_datapathput_datapath[4]), .Y(fin_req_i[4]))
	BUFX1 U5(.A(from_input_req_in_jump_input_datapathput_datapath[5]), .Y(fin_req_i[5]))
	BUFX1 U6(.A(from_input_req_in_jump_input_datapathput_datapath[6]), .Y(fin_req_i[6]))
	BUFX1 U7(.A(from_input_req_in_jump_input_datapathput_datapath[7]), .Y(fin_req_i[7]))
	BUFX1 U8(.A(from_input_req_in_jump_input_datapathput_datapath[8]), .Y(fin_req_i[8]))
	BUFX1 U9(.A(from_input_req_in_jump_input_datapathput_datapath[9]), .Y(fin_req_i[9]))
	BUFX1 U10(.A(from_input_req_in_jump_input_datapathput_datapath[10]), .Y(fin_req_i[10]))
	BUFX1 U11(.A(from_input_req_in_jump_input_datapathput_datapath[11]), .Y(fin_req_i[11]))
	BUFX1 U12(.A(from_input_req_in_jump_input_datapathput_datapath[12]), .Y(fin_req_i[12]))
	BUFX1 U13(.A(from_input_req_in_jump_input_datapathput_datapath[13]), .Y(fin_req_i[13]))
	BUFX1 U14(.A(from_input_req_in_jump_input_datapathput_datapath[14]), .Y(fin_req_i[14]))
	BUFX1 U15(.A(from_input_req_in_jump_input_datapathput_datapath[15]), .Y(fin_req_i[15]))
	BUFX1 U16(.A(from_input_req_in_jump_input_datapathput_datapath[16]), .Y(fin_req_i[16]))
	BUFX1 U17(.A(from_input_req_in_jump_input_datapathput_datapath[17]), .Y(fin_req_i[17]))
	BUFX1 U18(.A(from_input_req_in_jump_input_datapathput_datapath[18]), .Y(fin_req_i[18]))
	BUFX1 U19(.A(from_input_req_in_jump_input_datapathput_datapath[19]), .Y(fin_req_i[19]))
	BUFX1 U20(.A(from_input_req_in_jump_input_datapathput_datapath[20]), .Y(fin_req_i[20]))
	BUFX1 U21(.A(from_input_req_in_jump_input_datapathput_datapath[21]), .Y(fin_req_i[21]))
	BUFX1 U22(.A(from_input_req_in_jump_input_datapathput_datapath[22]), .Y(fin_req_i[22]))
	BUFX1 U23(.A(from_input_req_in_jump_input_datapathput_datapath[23]), .Y(fin_req_i[23]))
	BUFX1 U24(.A(from_input_req_in_jump_input_datapathput_datapath[24]), .Y(fin_req_i[24]))
	BUFX1 U25(.A(from_input_req_in_jump_input_datapathput_datapath[25]), .Y(fin_req_i[25]))
	BUFX1 U26(.A(from_input_req_in_jump_input_datapathput_datapath[26]), .Y(fin_req_i[26]))
	BUFX1 U27(.A(from_input_req_in_jump_input_datapathput_datapath[27]), .Y(fin_req_i[27]))
	BUFX1 U28(.A(from_input_req_in_jump_input_datapathput_datapath[28]), .Y(fin_req_i[28]))
	BUFX1 U29(.A(from_input_req_in_jump_input_datapathput_datapath[29]), .Y(fin_req_i[29]))
	BUFX1 U30(.A(from_input_req_in_jump_input_datapathput_datapath[30]), .Y(fin_req_i[30]))
	BUFX1 U31(.A(from_input_req_in_jump_input_datapathput_datapath[31]), .Y(fin_req_i[31]))
	BUFX1 U32(.A(from_input_req_in_jump_input_datapathput_datapath[32]), .Y(fin_req_i[32]))
	BUFX1 U33(.A(from_input_req_in_jump_input_datapathput_datapath[33]), .Y(fin_req_i[33]))
	BUFX1 U34(.A(from_input_req_in_jump_input_datapathput_datapath[34]), .Y(fin_req_i[34]))
	BUFX1 U35(.A(from_input_req_in_jump_input_datapathput_datapath[35]), .Y(fin_req_i[35]))
	BUFX1 U36(.A(from_input_req_in_jump_input_datapathput_datapath[36]), .Y(fin_req_i[36]))

    MUX21X1 U0012 (.IN1(from_input_req_in_jump_input_datapathput_datapath[vc_ch_act_in_input_datapath * 37]), .IN2(fin_req_i[0]), .S(req_in_jump_input_datapath), .Q(from_input_req_in_jump_input_datapathput_datapath[vc_ch_act_in_input_datapath * 37]));
    MUX21X1 U0013 (.IN1(from_input_req_in_jump_input_datapathput_datapath[vc_ch_act_in_input_datapath*37+2]), .IN2(vc_ch_act_in_input_datapath[1]), .S(req_in_jump_input_datapath), .Q(from_input_req_in_jump_input_datapathput_datapath[vc_ch_act_in_input_datapath*37+2]));
    MUX21X1 U0014 (.IN1(from_input_req_in_jump_input_datapathput_datapath[vc_ch_act_in_input_datapath*37+1]), .IN2(vc_ch_act_in_input_datapath[0]), .S(req_in_jump_input_datapath), .Q(from_input_req_in_jump_input_datapathput_datapath[vc_ch_act_in_input_datapath*37+1]));
    MUX21X1 U0015 (.IN1(fin_resp_o[0]), .IN2(from_input_resp_input_datapath[vc_ch_act_in_input_datapath]), .S(req_in_jump_input_datapath), .Q(fin_resp_o[0]));

    INVX1 U041 ( .A(req_in_jump_input_datapath), .Y(req_in_jump_input_datapath_not) );
    MUX21X1 U0016 (.IN1(fin_resp_o[0]), .IN2(1'sb1), .S(req_in_jump_input_datapath_not), .Q(fin_resp_o[0]));
    BUFX1 U34(.A(from_input_req_in_jump_input_datapathput_datapath[34]), .Y(fin_req_i[34]))

    XOR2X1 U0222 ( .IN1(_sv2v_jump_input_datapath[1]), .IN2(1'b1), .Q(xor1resu_input_datapath) );
    MUX21X1 U0017 (.IN1(_sv2v_jump_input_datapath[0]), .IN2(1'b0), .S(xor1resu_input_datapath), .Q(_sv2v_jump_input_datapath[0]));
    MUX21X1 U0018 (.IN1(_sv2v_jump_input_datapath[1]), .IN2(1'b0), .S(xor1resu_input_datapath), .Q(_sv2v_jump_input_datapath[1]));
    AND2X1 U38123 ( .IN1(xor1resu_input_datapath), .IN2(to_output_req_in_jump_input_datapathput_datapath[j*37]), .Q(and2resu_input_datapath) );
    MUX21X1 U0019 (.IN1(vc_ch_act_out_input_datapath[0]), .IN2(j[0]), .S(and2resu_input_datapath), .Q(vc_ch_act_out_input_datapath[0]));
    MUX21X1 U0020 (.IN1(vc_ch_act_out_input_datapath[1]), .IN2(j[1]), .S(and2resu_input_datapath), .Q(vc_ch_act_out_input_datapath[1]));
    MUX21X1 U0021 (.IN1(req_out_jump_input_datapath), .IN2(1'b1), .S(and2resu_input_datapath), .Q(req_out_jump_input_datapath));
    MUX21X1 U0022 (.IN1(_sv2v_jump_input_datapath[0]), .IN2(1'b0), .S(and2resu_input_datapath), .Q(_sv2v_jump_input_datapath[0]));
    MUX21X1 U0023 (.IN1(_sv2v_jump_input_datapath[1]), .IN2(1'b1), .S(and2resu_input_datapath), .Q(_sv2v_jump_input_datapath[1]));
    HADDX1 U00021 ( .A0(j[0]), .B0(1'b1), .C1(j[1]), .SO(j[0]) );
    HADDX1 U00022 ( .A0(j[0]), .B0(1'b1), .C1(j[1]), .SO(j[0]) );
    AND2X1 U38111 ( .IN1(xor1resu_input_datapath), .IN2(to_output_req_in_jump_input_datapathput_datapath[j*37]), .Q(and3resu) );
    NAND2X1 U29311(.A(_sv2v_jump_input_datapath[0]),.B(_sv2v_jump_input_datapath[1]),.Y(nand1resu_input_datapath));
    MUX21X1 U00212 (.IN1(_sv2v_jump_input_datapath[0]), .IN2(1'b0), .S(nand1resu_input_datapath), .Q(_sv2v_jump_input_datapath[0]));
    MUX21X1 U00213 (.IN1(_sv2v_jump_input_datapath[1]), .IN2(1'b0), .S(nand1resu_input_datapath), .Q(_sv2v_jump_input_datapath[1]));
    XNOR2X1 U17581 (.IN1(_sv2v_jump_input_datapath[0]), .IN2(_sv2v_jump_input_datapath[1]), .Q(xnor23resu_input_datapath) );
    AND2X1 U38111 ( .IN1(xnor23resu_input_datapath), .IN2(req_out_jump_input_datapath), .Q(and4resu_input_datapath) );

    MUX21X1 U3(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+3]),.IN2(fout_req_o[3]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+3]))
	MUX21X1 U4(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+4]),.IN2(fout_req_o[4]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+4]))
	MUX21X1 U5(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+5]),.IN2(fout_req_o[5]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+5]))
	MUX21X1 U6(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+6]),.IN2(fout_req_o[6]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+6]))
	MUX21X1 U7(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+7]),.IN2(fout_req_o[7]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+7]))
	MUX21X1 U8(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+8]),.IN2(fout_req_o[8]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+8]))
	MUX21X1 U9(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+9]),.IN2(fout_req_o[9]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+9]))
	MUX21X1 U10(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+10]),.IN2(fout_req_o[10]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+10]))
	MUX21X1 U11(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+11]),.IN2(fout_req_o[11]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+11]))
	MUX21X1 U12(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+12]),.IN2(fout_req_o[12]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+12]))
	MUX21X1 U13(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+13]),.IN2(fout_req_o[13]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+13]))
	MUX21X1 U14(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+14]),.IN2(fout_req_o[14]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+14]))
	MUX21X1 U15(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+15]),.IN2(fout_req_o[15]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+15]))
	MUX21X1 U16(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+16]),.IN2(fout_req_o[16]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+16]))
	MUX21X1 U17(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+17]),.IN2(fout_req_o[17]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+17]))
	MUX21X1 U18(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+18]),.IN2(fout_req_o[18]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+18]))
	MUX21X1 U19(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+19]),.IN2(fout_req_o[19]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+19]))
	MUX21X1 U20(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+20]),.IN2(fout_req_o[20]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+20]))
	MUX21X1 U21(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+21]),.IN2(fout_req_o[21]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+21]))
	MUX21X1 U22(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+22]),.IN2(fout_req_o[22]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+22]))
	MUX21X1 U23(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+23]),.IN2(fout_req_o[23]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+23]))
	MUX21X1 U24(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+24]),.IN2(fout_req_o[24]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+24]))
	MUX21X1 U25(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+25]),.IN2(fout_req_o[25]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+25]))
	MUX21X1 U26(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+26]),.IN2(fout_req_o[26]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+26]))
	MUX21X1 U27(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+27]),.IN2(fout_req_o[27]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+27]))
	MUX21X1 U28(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+28]),.IN2(fout_req_o[28]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+28]))
	MUX21X1 U29(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+29]),.IN2(fout_req_o[29]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+29]))
	MUX21X1 U30(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+30]),.IN2(fout_req_o[30]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+30]))
	MUX21X1 U31(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+31]),.IN2(fout_req_o[31]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+31]))
	MUX21X1 U32(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+32]),.IN2(fout_req_o[32]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+32]))
	MUX21X1 U33(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+33]),.IN2(fout_req_o[33]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+33]))
	MUX21X1 U34(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+34]),.IN2(fout_req_o[34]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+34]))
	MUX21X1 U35(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+35]),.IN2(fout_req_o[35]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+35]))
	MUX21X1 U36(.IN1(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+36]),.IN2(fout_req_o[36]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_ouot*37)+36]))

	MUX21X1 U321111(.IN1(fout_req_o[0]),.IN2(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_out_input_datapath * 37)]), .S(and4resu_input_datapath), .Q(fout_req_o[0]))
	MUX21X1 U331112(.IN1(fout_req_o[1]),.IN2(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_out_input_datapath*37)+1]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_out_input_datapath*37)+1]))
	MUX21X1 U331122(.IN1(fout_req_o[2]),.IN2(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_out_input_datapath*37)+2]), .S(and4resu_input_datapath), .Q(to_output_req_in_jump_input_datapathput_datapath[(vc_ch_act_out_input_datapath*37)+2]))
	MUX21X1 U352221(.IN1(to_output_resp_input_datapath[vc_ch_act_out_input_datapath]),.IN2(fout_resp_i), .S(and4resu_input_datapath), .Q(to_output_resp_input_datapath[vc_ch_act_out_input_datapath]))
	MUX21X1 U352221(.IN1(to_output_resp_input_datapath[vc_ch_act_out_input_datapath+1]),.IN2(fout_resp_i), .S(and4resu_input_datapath), .Q(to_output_resp_input_datapath[vc_ch_act_out_input_datapath+1]))
endmodule
