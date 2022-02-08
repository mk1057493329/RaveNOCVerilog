module output_module (clk,arst,fin_req_i,fin_resp_o,fout_req_o,fout_resp_i);
	input clk;
	input arst;
	input [148:0] fin_req_i;
	output [3:0] fin_resp_o;
	output [36:0] fout_req_o;
	input fout_resp_i;
	wire [11:0] valid_from_im;
	wire [11:0] grant_im;
	wire [2:0] tail_flit_im;
	wire [1:0] vc_ch_act_out;
	wire req_out,xnor1resu1,xnor2resu1,and1resu1,xor1resu1,and2resu1,head_flit_32_not,and3resu1,nor23resu1,nor23resu2,and4resu1,and5resu1,or12resu12,nor23resu3,and6resu1,nand1resu,and8resu1,norfinresu1,and9resu1,and10resu1,and11resu1;
	wire [33:0] head_flit;
	wire [0:1] _sv2v_jump;
	wire [31:0] in_mod;
	wire [31:0] vc_channel;
	wire [0:1] _sv2v_jump_1;
	wire [31:0] i;


	rr_arbiter #(.N_OF_INPUTS(4)) u_round_robin_arbiter(
		.clk(clk),
		.arst(arst),
		.update_i(tail_flit_im[0]),
		.req_i(valid_from_im[3:0]),
		.grant_o(grant_im[3:0])
	);

	rr_arbiter #(.N_OF_INPUTS(4)) u_round_robin_arbiter(
		.clk(clk),
		.arst(arst),
		.update_i(tail_flit_im[1]),
		.req_i(valid_from_im[7:4]),
		.grant_o(grant_im[7:4])
	);


	rr_arbiter #(.N_OF_INPUTS(4)) u_round_robin_arbiter(
		.clk(clk),
		.arst(arst),
		.update_i(tail_flit_im[2]),
		.req_i(valid_from_im[11:8]),
		.grant_o(grant_im[11:8])
	);


    XNOR2X1 U222 ( .IN1(fin_req_i[in_mod[1:0]*37]), .IN2(vc_channel[1]), .QN(xnor1resu1) );
    XNOR2X1 U223 ( .IN1(fin_req_i[in_mod[1:0]*37-1]), .IN2(vc_channel[0]), .QN(xnor2resu1) );
    AND2X1 U128 ( .IN1(xnor1resu1), .IN2(xnor2resu1), .Q(and1resu1) );
    MUX21X1 U0009 (.IN1(valid_from_im[(vc_channel[1:0]*4) + in_mod[1:0]]), .IN2(1'b1), .S(and1resu1), .Q(valid_from_im[(vc_channel[1:0]*4) + in_mod[1:0]]);
    HADDX1 U00021 ( .A0(vc_channel[0]), .B0(1'b1), .C1(vc_channel[1]), .SO(vc_channel[0]) );
    HADDX1 U00022 ( .A0(vc_channel[0]), .B0(1'b1), .C1(vc_channel[1]), .SO(vc_channel[0]) );
    HADDX1 U00023 ( .A0(in_mod[0]), .B0(1'b1), .C1(in_mod[1]), .SO(in_mod[0]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(vc_channel[1]), .SO(vc_channel[0]) );
    HADDX1 U00021 ( .A0(vc_channel[0]), .B0(1'b1), .C1(vc_channel[1]), .SO(vc_channel[0]) );
    HADDX1 U00022 ( .A0(vc_channel[0]), .B0(1'b1), .C1(vc_channel[1]), .SO(vc_channel[0]) );
    HADDX1 U00023 ( .A0(in_mod[0]), .B0(1'b1), .C1(in_mod[1]), .SO(in_mod[0]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(vc_channel[1]), .SO(vc_channel[0]) );
    HADDX1 U00021 ( .A0(vc_channel[0]), .B0(1'b1), .C1(vc_channel[1]), .SO(vc_channel[0]) );
    HADDX1 U00022 ( .A0(vc_channel[0]), .B0(1'b1), .C1(vc_channel[1]), .SO(vc_channel[0]) );  
    HADDX1 U00023 ( .A0(in_mod[0]), .B0(1'b1), .C1(in_mod[1]), .SO(in_mod[0]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(vc_channel[1]), .SO(vc_channel[0]) );
    HADDX1 U00021 ( .A0(vc_channel[0]), .B0(1'b1), .C1(vc_channel[1]), .SO(vc_channel[0]) );
    HADDX1 U00022 ( .A0(vc_channel[0]), .B0(1'b1), .C1(vc_channel[1]), .SO(vc_channel[0]) ); 
    XOR2X1 U02221 ( .IN1(_sv2v_jump[1]), .IN2(1'b1), .Q(xor1resu1) );
    MUX21X1 U00171 (.IN1(_sv2v_jump[0]), .IN2(1'b0), .S(xor1resu1), .Q(_sv2v_jump[0]));
    MUX21X1 U00181 (.IN1(_sv2v_jump[1]), .IN2(1'b0), .S(xor1resu1), .Q(_sv2v_jump[1]));
    MUX21X1 U00171 (.IN1(_sv2v_jump_1[0]), .IN2(_sv2v_jump[0]), .S(xor1resu1), .Q(_sv2v_jump_1[0]));
    MUX21X1 U00181 (.IN1(_sv2v_jump_1[1]), .IN2(_sv2v_jump[1]), .S(xor1resu1), .Q(_sv2v_jump_1[1]));
    AND2X1 U1218 ( .IN1(xor1resu1), .IN2(grant_im[vc_channel[1:0]*4+in_mod[1:0]]), .Q(and2resu1) );

    MUX21X1 U3(.IN1(head_flit[3]), .IN2(fin_req_i[in_mod[1:0]*37+3]), .S(and2resu1) ,.Q(head_flit[3]));
	MUX21X1 U4(.IN1(head_flit[4]), .IN2(fin_req_i[in_mod[1:0]*37+4]), .S(and2resu1) ,.Q(head_flit[4]));
	MUX21X1 U5(.IN1(head_flit[5]), .IN2(fin_req_i[in_mod[1:0]*37+5]), .S(and2resu1) ,.Q(head_flit[5]));
	MUX21X1 U6(.IN1(head_flit[6]), .IN2(fin_req_i[in_mod[1:0]*37+6]), .S(and2resu1) ,.Q(head_flit[6]));
	MUX21X1 U7(.IN1(head_flit[7]), .IN2(fin_req_i[in_mod[1:0]*37+7]), .S(and2resu1) ,.Q(head_flit[7]));
	MUX21X1 U8(.IN1(head_flit[8]), .IN2(fin_req_i[in_mod[1:0]*37+8]), .S(and2resu1) ,.Q(head_flit[8]));
	MUX21X1 U9(.IN1(head_flit[9]), .IN2(fin_req_i[in_mod[1:0]*37+9]), .S(and2resu1) ,.Q(head_flit[9]));
	MUX21X1 U10(.IN1(head_flit[10]), .IN2(fin_req_i[in_mod[1:0]*37+10]), .S(and2resu1) ,.Q(head_flit[10]));
	MUX21X1 U11(.IN1(head_flit[11]), .IN2(fin_req_i[in_mod[1:0]*37+11]), .S(and2resu1) ,.Q(head_flit[11]));
	MUX21X1 U12(.IN1(head_flit[12]), .IN2(fin_req_i[in_mod[1:0]*37+12]), .S(and2resu1) ,.Q(head_flit[12]));
	MUX21X1 U13(.IN1(head_flit[13]), .IN2(fin_req_i[in_mod[1:0]*37+13]), .S(and2resu1) ,.Q(head_flit[13]));
	MUX21X1 U14(.IN1(head_flit[14]), .IN2(fin_req_i[in_mod[1:0]*37+14]), .S(and2resu1) ,.Q(head_flit[14]));
	MUX21X1 U15(.IN1(head_flit[15]), .IN2(fin_req_i[in_mod[1:0]*37+15]), .S(and2resu1) ,.Q(head_flit[15]));
	MUX21X1 U16(.IN1(head_flit[16]), .IN2(fin_req_i[in_mod[1:0]*37+16]), .S(and2resu1) ,.Q(head_flit[16]));
	MUX21X1 U17(.IN1(head_flit[17]), .IN2(fin_req_i[in_mod[1:0]*37+17]), .S(and2resu1) ,.Q(head_flit[17]));
	MUX21X1 U18(.IN1(head_flit[18]), .IN2(fin_req_i[in_mod[1:0]*37+18]), .S(and2resu1) ,.Q(head_flit[18]));
	MUX21X1 U19(.IN1(head_flit[19]), .IN2(fin_req_i[in_mod[1:0]*37+19]), .S(and2resu1) ,.Q(head_flit[19]));
	MUX21X1 U20(.IN1(head_flit[20]), .IN2(fin_req_i[in_mod[1:0]*37+20]), .S(and2resu1) ,.Q(head_flit[20]));
	MUX21X1 U21(.IN1(head_flit[21]), .IN2(fin_req_i[in_mod[1:0]*37+21]), .S(and2resu1) ,.Q(head_flit[21]));
	MUX21X1 U22(.IN1(head_flit[22]), .IN2(fin_req_i[in_mod[1:0]*37+22]), .S(and2resu1) ,.Q(head_flit[22]));
	MUX21X1 U23(.IN1(head_flit[23]), .IN2(fin_req_i[in_mod[1:0]*37+23]), .S(and2resu1) ,.Q(head_flit[23]));
	MUX21X1 U24(.IN1(head_flit[24]), .IN2(fin_req_i[in_mod[1:0]*37+24]), .S(and2resu1) ,.Q(head_flit[24]));
	MUX21X1 U25(.IN1(head_flit[25]), .IN2(fin_req_i[in_mod[1:0]*37+25]), .S(and2resu1) ,.Q(head_flit[25]));
	MUX21X1 U26(.IN1(head_flit[26]), .IN2(fin_req_i[in_mod[1:0]*37+26]), .S(and2resu1) ,.Q(head_flit[26]));
	MUX21X1 U27(.IN1(head_flit[27]), .IN2(fin_req_i[in_mod[1:0]*37+27]), .S(and2resu1) ,.Q(head_flit[27]));
	MUX21X1 U28(.IN1(head_flit[28]), .IN2(fin_req_i[in_mod[1:0]*37+28]), .S(and2resu1) ,.Q(head_flit[28]));
	MUX21X1 U29(.IN1(head_flit[29]), .IN2(fin_req_i[in_mod[1:0]*37+29]), .S(and2resu1) ,.Q(head_flit[29]));
	MUX21X1 U30(.IN1(head_flit[30]), .IN2(fin_req_i[in_mod[1:0]*37+30]), .S(and2resu1) ,.Q(head_flit[30]));
	MUX21X1 U31(.IN1(head_flit[31]), .IN2(fin_req_i[in_mod[1:0]*37+31]), .S(and2resu1) ,.Q(head_flit[31]));
	MUX21X1 U32(.IN1(head_flit[32]), .IN2(fin_req_i[in_mod[1:0]*37+32]), .S(and2resu1) ,.Q(head_flit[32]));
	MUX21X1 U33(.IN1(head_flit[33]), .IN2(fin_req_i[in_mod[1:0]*37+33]), .S(and2resu1) ,.Q(head_flit[33]));
	MUX21X1 U34(.IN1(head_flit[34]), .IN2(fin_req_i[in_mod[1:0]*37+34]), .S(and2resu1) ,.Q(head_flit[34]));
	MUX21X1 U35(.IN1(head_flit[35]), .IN2(fin_req_i[in_mod[1:0]*37+35]), .S(and2resu1) ,.Q(head_flit[35]));
	MUX21X1 U36(.IN1(head_flit[36]), .IN2(fin_req_i[in_mod[1:0]*37+36]), .S(and2resu1) ,.Q(head_flit[36]));

    INVX1 U041 ( .A(head_flit[32]), .Y(head_flit_32_not) );
    AND2X1 U1218 ( .IN1(head_flit_32_not), .IN2(head_flit[33]), .Q(and3resu1) );
    NOR4X1 U175821 (.IN1(head_flit[29]), .IN2(head_flit[28]), .IN3(head_flit[27]), .IN4(head_flit[26]), .Q(nor23resu1) );
    NOR4X1 U175831 (.IN1(head_flit[25]), .IN2(head_flit[24]), .IN3(head_flit[23]), .IN4(head_flit[22]), .Q(nor23resu2) );
    AND2X1 U12183 ( .IN1(nor23resu1), .IN2(nor23resu2), .Q(and4resu1) );
    NOR2X1 U1758211 (.IN1(head_flit[33]), .IN2(head_flit[32]), .Q(nor23resu3) );
    AND2X1 U12183 ( .IN1(nor23resu3), .IN2(and4resu1), .Q(and5resu1) );    
    OR2X1 U17582121 (.IN1(and3resu1), .IN2(nor23resu3), .Q(or12resu12) );
    AND2X1 U12183 ( .IN1(fout_resp_i[0]), .IN2(or12resu12), .Q(and6resu1) );    
	MUX21X1 U361(.IN1(tail_flit_im[vc_channel[1:0]]), .IN2(and6resu1), .S(and2resu1) ,.Q(tail_flit_im[vc_channel[1:0]]);
	MUX21X1 U3621(.IN1(_sv2v_jump[0]), .IN2(1'b0), .S(and2resu1) ,.Q(_sv2v_jump[0]);
	MUX21X1 U3631(.IN1(_sv2v_jump[1]), .IN2(1'b1), .S(and2resu1) ,.Q(_sv2v_jump[1]);
    NAND2X1 U29311(.A(_sv2v_jump[0]),.B(_sv2v_jump[1]),.Y(nand1resu));

    AND2X1 U12483 ( .IN1(xor1resu1), .IN2(nand1resu), .Q(and7resu1) );    
	MUX21X1 U3621(.IN1(_sv2v_jump[0]), .IN2(_sv2v_jump_1[0]), .S(and7resu1) ,.Q(_sv2v_jump[0]);
	MUX21X1 U3631(.IN1(_sv2v_jump[1]), .IN2(_sv2v_jump_1[1]), .S(and7resu1) ,.Q(_sv2v_jump[1]);

	MUX21X1 U3621(.IN1(_sv2v_jump[0]), .IN2(1'b0), .S(and7resu1) ,.Q(_sv2v_jump[0]);
	MUX21X1 U3631(.IN1(_sv2v_jump[1]), .IN2(1'b0), .S(and7resu1) ,.Q(_sv2v_jump[1]);

	HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(vc_channel[1]), .SO(vc_channel[0]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(in_mod[1]), .SO(in_mod[0]) );
    HADDX1 U00021 ( .A0(in_mod[0]), .B0(1'b1), .C1(in_mod[1]), .SO(in_mod[0]) );
    HADDX1 U00021 ( .A0(in_mod[0]), .B0(1'b1), .C1(in_mod[1]), .SO(in_mod[0]) );
    HADDX1 U00021 ( .A0(in_mod[0]), .B0(1'b1), .C1(in_mod[1]), .SO(in_mod[0]) );
	HADDX1 U00021 ( .A0(vc_channel[0]), .B0(1'b1), .C1(vc_channel[1]), .SO(vc_channel[0]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(in_mod[1]), .SO(in_mod[0]) );
    HADDX1 U00021 ( .A0(in_mod[0]), .B0(1'b1), .C1(in_mod[1]), .SO(in_mod[0]) );
    HADDX1 U00021 ( .A0(in_mod[0]), .B0(1'b1), .C1(in_mod[1]), .SO(in_mod[0]) );
    HADDX1 U00021 ( .A0(in_mod[0]), .B0(1'b1), .C1(in_mod[1]), .SO(in_mod[0]) );
	HADDX1 U00021 ( .A0(vc_channel[0]), .B0(1'b1), .C1(vc_channel[1]), .SO(vc_channel[0]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(in_mod[1]), .SO(in_mod[0]) );
    HADDX1 U00021 ( .A0(in_mod[0]), .B0(1'b1), .C1(in_mod[1]), .SO(in_mod[0]) );
    HADDX1 U00021 ( .A0(in_mod[0]), .B0(1'b1), .C1(in_mod[1]), .SO(in_mod[0]) );
    HADDX1 U00021 ( .A0(in_mod[0]), .B0(1'b1), .C1(in_mod[1]), .SO(in_mod[0]) );



	BUFX1 U4(.A(1'b0), .Y(_sv2v_jump[0]));
	BUFX1 U4(.A(1'b0), .Y(_sv2v_jump[1]));
    AND2X1 U12483 ( .IN1(xor1resu1), .IN2(grant_im[i[1:0] * 4+:4]), .Q(and8resu1) );    
    MUX21X1 U3621(.IN1(vc_ch_act_out[0]), .IN2(i[1:0]), .S(and8resu1) ,.Q(vc_ch_act_out[0]);
	MUX21X1 U3631(.IN1(vc_ch_act_out[1]), .IN2(i[1:0]), .S(and8resu1) ,.Q(vc_ch_act_out[1]);
	MUX21X1 U3631(.IN1(req_out), .IN2(1'b1), .S(and8resu1) ,.Q(req_out);
	MUX21X1 U3621(.IN1(_sv2v_jump[0]), .IN2(1'b0), .S(and8resu1) ,.Q(_sv2v_jump[0]);
	MUX21X1 U3631(.IN1(_sv2v_jump[1]), .IN2(1'b1), .S(and8resu1) ,.Q(_sv2v_jump[1]);
	HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(i[1]), .SO(i[0]) );
    HADDX1 U00021 ( .A0(in_mod[0]), .B0(1'b1), .C1(i[1]), .SO(i[0]) );
    HADDX1 U00021 ( .A0(in_mod[0]), .B0(1'b1), .C1(i[1]), .SO(i[0]) );

    NOR2X1 U1758211 (.IN1(_sv2v_jump[0]), .IN2(_sv2v_jump[1]), .Q(norfinresu1) );
    AND2X1 U124831 ( .IN1(norfinresu1), .IN2(req_out), .Q(and9resu1) );    
	HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(i[1]), .SO(i[0]) );
    AND2X1 U124831 ( .IN1(and9resu1), .IN2(grant_im[(vc_ch_act_out * 4) + i[1:0]]), .Q(and10resu1) );    

	MUX21X1 U3(.IN1(fout_req_o[3]), .IN2(fin_req_i[i[1:0]*37+3]), .S(and10resu1) ,.Q(fout_req_o[3]));
	MUX21X1 U4(.IN1(fout_req_o[4]), .IN2(fin_req_i[i[1:0]*37+4]), .S(and10resu1) ,.Q(fout_req_o[4]));
	MUX21X1 U5(.IN1(fout_req_o[5]), .IN2(fin_req_i[i[1:0]*37+5]), .S(and10resu1) ,.Q(fout_req_o[5]));
	MUX21X1 U6(.IN1(fout_req_o[6]), .IN2(fin_req_i[i[1:0]*37+6]), .S(and10resu1) ,.Q(fout_req_o[6]));
	MUX21X1 U7(.IN1(fout_req_o[7]), .IN2(fin_req_i[i[1:0]*37+7]), .S(and10resu1) ,.Q(fout_req_o[7]));
	MUX21X1 U8(.IN1(fout_req_o[8]), .IN2(fin_req_i[i[1:0]*37+8]), .S(and10resu1) ,.Q(fout_req_o[8]));
	MUX21X1 U9(.IN1(fout_req_o[9]), .IN2(fin_req_i[i[1:0]*37+9]), .S(and10resu1) ,.Q(fout_req_o[9]));
	MUX21X1 U10(.IN1(fout_req_o[10]), .IN2(fin_req_i[i[1:0]*37+10]), .S(and10resu1) ,.Q(fout_req_o[10]));
	MUX21X1 U11(.IN1(fout_req_o[11]), .IN2(fin_req_i[i[1:0]*37+11]), .S(and10resu1) ,.Q(fout_req_o[11]));
	MUX21X1 U12(.IN1(fout_req_o[12]), .IN2(fin_req_i[i[1:0]*37+12]), .S(and10resu1) ,.Q(fout_req_o[12]));
	MUX21X1 U13(.IN1(fout_req_o[13]), .IN2(fin_req_i[i[1:0]*37+13]), .S(and10resu1) ,.Q(fout_req_o[13]));
	MUX21X1 U14(.IN1(fout_req_o[14]), .IN2(fin_req_i[i[1:0]*37+14]), .S(and10resu1) ,.Q(fout_req_o[14]));
	MUX21X1 U15(.IN1(fout_req_o[15]), .IN2(fin_req_i[i[1:0]*37+15]), .S(and10resu1) ,.Q(fout_req_o[15]));
	MUX21X1 U16(.IN1(fout_req_o[16]), .IN2(fin_req_i[i[1:0]*37+16]), .S(and10resu1) ,.Q(fout_req_o[16]));
	MUX21X1 U17(.IN1(fout_req_o[17]), .IN2(fin_req_i[i[1:0]*37+17]), .S(and10resu1) ,.Q(fout_req_o[17]));
	MUX21X1 U18(.IN1(fout_req_o[18]), .IN2(fin_req_i[i[1:0]*37+18]), .S(and10resu1) ,.Q(fout_req_o[18]));
	MUX21X1 U19(.IN1(fout_req_o[19]), .IN2(fin_req_i[i[1:0]*37+19]), .S(and10resu1) ,.Q(fout_req_o[19]));
	MUX21X1 U20(.IN1(fout_req_o[20]), .IN2(fin_req_i[i[1:0]*37+20]), .S(and10resu1) ,.Q(fout_req_o[20]));
	MUX21X1 U21(.IN1(fout_req_o[21]), .IN2(fin_req_i[i[1:0]*37+21]), .S(and10resu1) ,.Q(fout_req_o[21]));
	MUX21X1 U22(.IN1(fout_req_o[22]), .IN2(fin_req_i[i[1:0]*37+22]), .S(and10resu1) ,.Q(fout_req_o[22]));
	MUX21X1 U23(.IN1(fout_req_o[23]), .IN2(fin_req_i[i[1:0]*37+23]), .S(and10resu1) ,.Q(fout_req_o[23]));
	MUX21X1 U24(.IN1(fout_req_o[24]), .IN2(fin_req_i[i[1:0]*37+24]), .S(and10resu1) ,.Q(fout_req_o[24]));
	MUX21X1 U25(.IN1(fout_req_o[25]), .IN2(fin_req_i[i[1:0]*37+25]), .S(and10resu1) ,.Q(fout_req_o[25]));
	MUX21X1 U26(.IN1(fout_req_o[26]), .IN2(fin_req_i[i[1:0]*37+26]), .S(and10resu1) ,.Q(fout_req_o[26]));
	MUX21X1 U27(.IN1(fout_req_o[27]), .IN2(fin_req_i[i[1:0]*37+27]), .S(and10resu1) ,.Q(fout_req_o[27]));
	MUX21X1 U28(.IN1(fout_req_o[28]), .IN2(fin_req_i[i[1:0]*37+28]), .S(and10resu1) ,.Q(fout_req_o[28]));
	MUX21X1 U29(.IN1(fout_req_o[29]), .IN2(fin_req_i[i[1:0]*37+29]), .S(and10resu1) ,.Q(fout_req_o[29]));
	MUX21X1 U30(.IN1(fout_req_o[30]), .IN2(fin_req_i[i[1:0]*37+30]), .S(and10resu1) ,.Q(fout_req_o[30]));
	MUX21X1 U31(.IN1(fout_req_o[31]), .IN2(fin_req_i[i[1:0]*37+31]), .S(and10resu1) ,.Q(fout_req_o[31]));
	MUX21X1 U32(.IN1(fout_req_o[32]), .IN2(fin_req_i[i[1:0]*37+32]), .S(and10resu1) ,.Q(fout_req_o[32]));
	MUX21X1 U33(.IN1(fout_req_o[33]), .IN2(fin_req_i[i[1:0]*37+33]), .S(and10resu1) ,.Q(fout_req_o[33]));
	MUX21X1 U34(.IN1(fout_req_o[34]), .IN2(fin_req_i[i[1:0]*37+34]), .S(and10resu1) ,.Q(fout_req_o[34]));
	MUX21X1 U35(.IN1(fout_req_o[35]), .IN2(fin_req_i[i[1:0]*37+35]), .S(and10resu1) ,.Q(fout_req_o[35]));
	MUX21X1 U36(.IN1(fout_req_o[36]), .IN2(fin_req_i[i[1:0]*37+36]), .S(and10resu1) ,.Q(fout_req_o[36]));

	MUX21X1 U36221(.IN1(fout_req_o[0]), .IN2(fin_req_i[i[1:0]*37]), .S(and10resu1) ,.Q(fout_req_o[0]);
	MUX21X1 U36221(.IN1(fout_req_o[1]), .IN2(vc_ch_act_out[0]), .S(and10resu1) ,.Q(fout_req_o[1]);
	MUX21X1 U36331(.IN1(fout_req_o[2]), .IN2(vc_ch_act_out[1]), .S(and10resu1) ,.Q(fout_req_o[2]);    
	MUX21X1 U36221(.IN1(_sv2v_jump[0]), .IN2(1'b0), .S(and10resu1) ,.Q(_sv2v_jump[0]);
	MUX21X1 U36331(.IN1(_sv2v_jump[1]), .IN2(1'b1), .S(and10resu1) ,.Q(_sv2v_jump[1]);    

    AND2X1 U124831 ( .IN1(and9resu1), .IN2(nand1resu), .Q(and11resu1) );    
	MUX21X1 U36221(.IN1(_sv2v_jump[0]), .IN2(1'b0), .S(and11resu1) ,.Q(_sv2v_jump[0]);
	MUX21X1 U36331(.IN1(_sv2v_jump[1]), .IN2(1'b0), .S(and11resu1) ,.Q(_sv2v_jump[1]);    
	
endmodule
