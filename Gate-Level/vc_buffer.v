module vc_buffer (clk,arst,vc_id_i,vc_id_o,fdata_i,valid_i,ready_o,fdata_o,valid_o,ready_i);
	input clk;
	input arst;
	input [1:0] vc_id_i;
	output [1:0] vc_id_o;
	input [33:0] fdata_i;
	input valid_i;
	output ready_o;
	output [33:0] fdata_o;
	output valid_o;
	input ready_i;
	wire write_flit,norres,full,empty,error,read_flit,locked_by_route_ff,next_locked,orres,or1res,or2res,finres1,andres1,full_not,locked_by_route_ff_not,thirdand;
	wire [33:0] flit;

	fifo #(
		.SLOTS(2),
		.WIDTH(34)
	) u_virt_chn_fifo(
		.clk(clk),
		.arst(arst),
		.write_i(write_flit),
		.read_i(read_flit),
		.data_i(fdata_i),
		.data_o(fdata_o),
		.error_o(error),
		.full_o(full),
		.empty_o(empty),
		.ocup_o()
	);

    BUFX1 U00 ( .A(locked_by_route_ff), .Y(next_locked) );
    BUFX1 U0(.A(flit[0]), .Y(fdata_i[0]));
	BUFX1 U1(.A(flit[1]), .Y(fdata_i[1]));
	BUFX1 U2(.A(flit[2]), .Y(fdata_i[2]));
	BUFX1 U3(.A(flit[3]), .Y(fdata_i[3]));
	BUFX1 U4(.A(flit[4]), .Y(fdata_i[4]));
	BUFX1 U5(.A(flit[5]), .Y(fdata_i[5]));
	BUFX1 U6(.A(flit[6]), .Y(fdata_i[6]));
	BUFX1 U7(.A(flit[7]), .Y(fdata_i[7]));
	BUFX1 U8(.A(flit[8]), .Y(fdata_i[8]));
	BUFX1 U9(.A(flit[9]), .Y(fdata_i[9]));
	BUFX1 U10(.A(flit[10]), .Y(fdata_i[10]));
	BUFX1 U11(.A(flit[11]), .Y(fdata_i[11]));
	BUFX1 U12(.A(flit[12]), .Y(fdata_i[12]));
	BUFX1 U13(.A(flit[13]), .Y(fdata_i[13]));
	BUFX1 U14(.A(flit[14]), .Y(fdata_i[14]));
	BUFX1 U15(.A(flit[15]), .Y(fdata_i[15]));
	BUFX1 U16(.A(flit[16]), .Y(fdata_i[16]));
	BUFX1 U17(.A(flit[17]), .Y(fdata_i[17]));
	BUFX1 U18(.A(flit[18]), .Y(fdata_i[18]));
	BUFX1 U19(.A(flit[19]), .Y(fdata_i[19]));
	BUFX1 U20(.A(flit[20]), .Y(fdata_i[20]));
	BUFX1 U21(.A(flit[21]), .Y(fdata_i[21]));
	BUFX1 U22(.A(flit[22]), .Y(fdata_i[22]));
	BUFX1 U23(.A(flit[23]), .Y(fdata_i[23]));
	BUFX1 U24(.A(flit[24]), .Y(fdata_i[24]));
	BUFX1 U25(.A(flit[25]), .Y(fdata_i[25]));
	BUFX1 U26(.A(flit[26]), .Y(fdata_i[26]));
	BUFX1 U27(.A(flit[27]), .Y(fdata_i[27]));
	BUFX1 U28(.A(flit[28]), .Y(fdata_i[28]));
	BUFX1 U29(.A(flit[29]), .Y(fdata_i[29]));
	BUFX1 U30(.A(flit[30]), .Y(fdata_i[30]));
	BUFX1 U31(.A(flit[31]), .Y(fdata_i[31]));
	BUFX1 U32(.A(flit[32]), .Y(fdata_i[32]));
	BUFX1 U33(.A(flit[33]), .Y(fdata_i[33]));
    NOR2X1 U34 ( .IN1(flit[33]), .IN2(flit[32]), .QN(norres) );
    OR4X1 U35 ( .IN1(flit[29]), .IN2(flit[28]), .IN3(flit[27]), .IN4(flit[26]), .Y(or1res) );
    OR4X1 U35 ( .IN1(flit[25]), .IN2(flit[24]), .IN3(flit[23]), .IN4(flit[22]), .Y(or2res) );
    OR2X1 U36 ( .A(or1res), .B(or2res), .Y(orres) );
    AND3X1 U37 ( .IN1(valid_i), .IN2(norres), .IN3(orres), .Q(finres1) );
    MUX21X1 U38 (.IN1(next_locked), .IN2(1'b1), .S(finres1), .Q(next_locked);
    AND3X1 U39 ( .IN1(valid_i), .IN2(flit[33]), .IN3(flit[32]), .Q(andres1) );
    MUX21X1 U40 (.IN1(next_locked), .IN2(1'b0), .S(andres1), .Q(next_locked);

    INVX1 U41 ( .A(full), .Y(full_not) );
    INVX1 U42 ( .A(locked_by_route_ff), .Y(locked_by_route_ff_not) );

    MUX21X1 U43 (.IN1(1'b1), .IN2(locked_by_route_ff_not), .S(norres), .Q(thirdand);
    AND3X1 U44 ( .IN1(valid_i), .IN2(full_not), .IN3(thirdand), .Q(write_flit) );
    AND2X1 U45 ( .IN1(full_not), .IN2(norres), .Q(ready_o) );
    INVX1 U46 ( .A(empty), .Y(valid_o) );
    AND2X1 U47 ( .IN1(valid_o), .IN2(ready_i), .Q(read_flit) );
	BUFX1 U48(.A(vc_id_o), .Y(vc_id_i));

	DFFX2 U49 ( .CLK(clk), .D(arst), .Q(arst_value) );
    DFFX2 U50 ( .CLK(arst), .D(arst), .Q(arst_value) );
    MUX21X1 U51 (.IN1(next_locked), .IN2(1'sb0), .S(arst_value), .Q(locked_by_route_ff);

endmodule
