module input_datapath (clk,arst,fin_req_i,fin_resp_o,fout_req_o,fout_resp_i);
	input clk;
	input arst;
	input wire [36:0] fin_req_i;
	output [0:0] fin_resp_o;
	output [36:0] fout_req_o;
	input [0:0] fout_resp_i;
	wire [110:0] from_input_req;
	wire [2:0] from_input_resp;
	wire [110:0] to_output_req;
	wire [2:0] to_output_resp;
	wire [1:0] vc_ch_act_in;
	wire [1:0] vc_ch_act_out;
	wire [2:0] i;
	wire [2:0] j;
	wire [0:1] _sv2v_jump

	wire req_in,req_out,xnor1resu,xnor2resu,and1resu,cond1line,req_in_not,and2resu,xor1resu,nand1resu,xnor23resu,and4resu;


	vc_buffer u_virtual_channel_fifo(
		.clk(clk),
		.arst(arst),
		.vc_id_i(2'b00),
		.vc_id_o(to_output_req[2:1),
		.fdata_i(from_input_req[36:3),
		.valid_i(from_input_req[0]),
		.ready_o(from_input_resp[0]),
		.fdata_o(to_output_req[36:3]),
		.valid_o(to_output_req[0]),
		.ready_i(to_output_resp[0])
	);

	vc_buffer u_virtual_channel_fifo(
		.clk(clk),
		.arst(arst),
		.vc_id_i(2'b01),
		.vc_id_o(to_output_req[39:38]),
		.fdata_i(from_input_req[73:40]),
		.valid_i(from_input_req[37]),
		.ready_o(from_input_resp[1]),
		.fdata_o(to_output_req[73:40]),
		.valid_o(to_output_req[37]),
		.ready_i(to_output_resp[1])
	);

	vc_buffer u_virtual_channel_fifo(
		.clk(clk),
		.arst(arst),
		.vc_id_i(2'b10),
		.vc_id_o(to_output_req[76:75]),
		.fdata_i(from_input_req[110:77]),
		.valid_i(from_input_req[74]),
		.ready_o(from_input_resp[2]),
		.fdata_o(to_output_req[110:77]),
		.valid_o(to_output_req[74]),
		.ready_i(to_output_resp[2])
	);

	BUFX1 U3(.A(from_input_req[77]), .Y(fin_req_i[3]))
	BUFX1 U4(.A(from_input_req[78]), .Y(fin_req_i[4]))
	BUFX1 U5(.A(from_input_req[79]), .Y(fin_req_i[5]))
	BUFX1 U6(.A(from_input_req[80]), .Y(fin_req_i[6]))
	BUFX1 U7(.A(from_input_req[81]), .Y(fin_req_i[7]))
	BUFX1 U8(.A(from_input_req[82]), .Y(fin_req_i[8]))
	BUFX1 U9(.A(from_input_req[83]), .Y(fin_req_i[9]))
	BUFX1 U10(.A(from_input_req[84]), .Y(fin_req_i[10]))
	BUFX1 U11(.A(from_input_req[85]), .Y(fin_req_i[11]))
	BUFX1 U12(.A(from_input_req[86]), .Y(fin_req_i[12]))
	BUFX1 U13(.A(from_input_req[87]), .Y(fin_req_i[13]))
	BUFX1 U14(.A(from_input_req[88]), .Y(fin_req_i[14]))
	BUFX1 U15(.A(from_input_req[89]), .Y(fin_req_i[15]))
	BUFX1 U16(.A(from_input_req[90]), .Y(fin_req_i[16]))
	BUFX1 U17(.A(from_input_req[91]), .Y(fin_req_i[17]))
	BUFX1 U18(.A(from_input_req[92]), .Y(fin_req_i[18]))
	BUFX1 U19(.A(from_input_req[93]), .Y(fin_req_i[19]))
	BUFX1 U20(.A(from_input_req[94]), .Y(fin_req_i[20]))
	BUFX1 U21(.A(from_input_req[95]), .Y(fin_req_i[21]))
	BUFX1 U22(.A(from_input_req[96]), .Y(fin_req_i[22]))
	BUFX1 U23(.A(from_input_req[97]), .Y(fin_req_i[23]))
	BUFX1 U24(.A(from_input_req[98]), .Y(fin_req_i[24]))
	BUFX1 U25(.A(from_input_req[99]), .Y(fin_req_i[25]))
	BUFX1 U26(.A(from_input_req[100]), .Y(fin_req_i[26]))
	BUFX1 U27(.A(from_input_req[101]), .Y(fin_req_i[27]))
	BUFX1 U28(.A(from_input_req[102]), .Y(fin_req_i[28]))
	BUFX1 U29(.A(from_input_req[103]), .Y(fin_req_i[29]))
	BUFX1 U30(.A(from_input_req[104]), .Y(fin_req_i[30]))
	BUFX1 U31(.A(from_input_req[105]), .Y(fin_req_i[31]))
	BUFX1 U32(.A(from_input_req[106]), .Y(fin_req_i[32]))
	BUFX1 U33(.A(from_input_req[107]), .Y(fin_req_i[33]))
	BUFX1 U34(.A(from_input_req[108]), .Y(fin_req_i[34]))
	BUFX1 U35(.A(from_input_req[109]), .Y(fin_req_i[35]))
	BUFX1 U36(.A(from_input_req[110]), .Y(fin_req_i[36]))
    XNOR2X1 U222 ( .IN1(fin_req_i[1]), .IN2(i[0]), .QN(xnor1resu) );
    XNOR2X1 U222 ( .IN1(fin_req_i[2]), .IN2(i[1]), .QN(xnor2resu) );
    AND2X1 U128 ( .IN1(xnor1resu), .IN2(xnor2resu), .Q(and1resu) );
    AND3X1 U128 ( .IN1(and1resu), .IN2(fin_req_i[0]), .IN2(fin_req_i[0]), .Q(cond1line) );
    MUX21X1 U0009 (.IN1(vc_ch_act_in[0]), .IN2(i[0]), .S(cond1line), .Q(vc_ch_act_in[0]));
    MUX21X1 U0010 (.IN1(vc_ch_act_in[1]), .IN2(i[1]), .S(cond1line), .Q(vc_ch_act_in[1]));
    MUX21X1 U0011 (.IN1(req_in), .IN2(1), .S(cond1line), .Q(req_in));
	BUFX1 U3(.A(from_input_req[40]), .Y(fin_req_i[3]))
	BUFX1 U4(.A(from_input_req[41]), .Y(fin_req_i[4]))
	BUFX1 U5(.A(from_input_req[42]), .Y(fin_req_i[5]))
	BUFX1 U6(.A(from_input_req[43]), .Y(fin_req_i[6]))
	BUFX1 U7(.A(from_input_req[44]), .Y(fin_req_i[7]))
	BUFX1 U8(.A(from_input_req[45]), .Y(fin_req_i[8]))
	BUFX1 U9(.A(from_input_req[46]), .Y(fin_req_i[9]))
	BUFX1 U10(.A(from_input_req[47]), .Y(fin_req_i[10]))
	BUFX1 U11(.A(from_input_req[48]), .Y(fin_req_i[11]))
	BUFX1 U12(.A(from_input_req[49]), .Y(fin_req_i[12]))
	BUFX1 U13(.A(from_input_req[50]), .Y(fin_req_i[13]))
	BUFX1 U14(.A(from_input_req[51]), .Y(fin_req_i[14]))
	BUFX1 U15(.A(from_input_req[52]), .Y(fin_req_i[15]))
	BUFX1 U16(.A(from_input_req[53]), .Y(fin_req_i[16]))
	BUFX1 U17(.A(from_input_req[54]), .Y(fin_req_i[17]))
	BUFX1 U18(.A(from_input_req[55]), .Y(fin_req_i[18]))
	BUFX1 U19(.A(from_input_req[56]), .Y(fin_req_i[19]))
	BUFX1 U20(.A(from_input_req[57]), .Y(fin_req_i[20]))
	BUFX1 U21(.A(from_input_req[58]), .Y(fin_req_i[21]))
	BUFX1 U22(.A(from_input_req[59]), .Y(fin_req_i[22]))
	BUFX1 U23(.A(from_input_req[60]), .Y(fin_req_i[23]))
	BUFX1 U24(.A(from_input_req[61]), .Y(fin_req_i[24]))
	BUFX1 U25(.A(from_input_req[62]), .Y(fin_req_i[25]))
	BUFX1 U26(.A(from_input_req[63]), .Y(fin_req_i[26]))
	BUFX1 U27(.A(from_input_req[64]), .Y(fin_req_i[27]))
	BUFX1 U28(.A(from_input_req[65]), .Y(fin_req_i[28]))
	BUFX1 U29(.A(from_input_req[66]), .Y(fin_req_i[29]))
	BUFX1 U30(.A(from_input_req[67]), .Y(fin_req_i[30]))
	BUFX1 U31(.A(from_input_req[68]), .Y(fin_req_i[31]))
	BUFX1 U32(.A(from_input_req[69]), .Y(fin_req_i[32]))
	BUFX1 U33(.A(from_input_req[70]), .Y(fin_req_i[33]))
	BUFX1 U34(.A(from_input_req[71]), .Y(fin_req_i[34]))
	BUFX1 U35(.A(from_input_req[72]), .Y(fin_req_i[35]))
	BUFX1 U36(.A(from_input_req[73]), .Y(fin_req_i[36]))

	BUFX1 U3(.A(from_input_req[3]), .Y(fin_req_i[3]))
	BUFX1 U4(.A(from_input_req[4]), .Y(fin_req_i[4]))
	BUFX1 U5(.A(from_input_req[5]), .Y(fin_req_i[5]))
	BUFX1 U6(.A(from_input_req[6]), .Y(fin_req_i[6]))
	BUFX1 U7(.A(from_input_req[7]), .Y(fin_req_i[7]))
	BUFX1 U8(.A(from_input_req[8]), .Y(fin_req_i[8]))
	BUFX1 U9(.A(from_input_req[9]), .Y(fin_req_i[9]))
	BUFX1 U10(.A(from_input_req[10]), .Y(fin_req_i[10]))
	BUFX1 U11(.A(from_input_req[11]), .Y(fin_req_i[11]))
	BUFX1 U12(.A(from_input_req[12]), .Y(fin_req_i[12]))
	BUFX1 U13(.A(from_input_req[13]), .Y(fin_req_i[13]))
	BUFX1 U14(.A(from_input_req[14]), .Y(fin_req_i[14]))
	BUFX1 U15(.A(from_input_req[15]), .Y(fin_req_i[15]))
	BUFX1 U16(.A(from_input_req[16]), .Y(fin_req_i[16]))
	BUFX1 U17(.A(from_input_req[17]), .Y(fin_req_i[17]))
	BUFX1 U18(.A(from_input_req[18]), .Y(fin_req_i[18]))
	BUFX1 U19(.A(from_input_req[19]), .Y(fin_req_i[19]))
	BUFX1 U20(.A(from_input_req[20]), .Y(fin_req_i[20]))
	BUFX1 U21(.A(from_input_req[21]), .Y(fin_req_i[21]))
	BUFX1 U22(.A(from_input_req[22]), .Y(fin_req_i[22]))
	BUFX1 U23(.A(from_input_req[23]), .Y(fin_req_i[23]))
	BUFX1 U24(.A(from_input_req[24]), .Y(fin_req_i[24]))
	BUFX1 U25(.A(from_input_req[25]), .Y(fin_req_i[25]))
	BUFX1 U26(.A(from_input_req[26]), .Y(fin_req_i[26]))
	BUFX1 U27(.A(from_input_req[27]), .Y(fin_req_i[27]))
	BUFX1 U28(.A(from_input_req[28]), .Y(fin_req_i[28]))
	BUFX1 U29(.A(from_input_req[29]), .Y(fin_req_i[29]))
	BUFX1 U30(.A(from_input_req[30]), .Y(fin_req_i[30]))
	BUFX1 U31(.A(from_input_req[31]), .Y(fin_req_i[31]))
	BUFX1 U32(.A(from_input_req[32]), .Y(fin_req_i[32]))
	BUFX1 U33(.A(from_input_req[33]), .Y(fin_req_i[33]))
	BUFX1 U34(.A(from_input_req[34]), .Y(fin_req_i[34]))
	BUFX1 U35(.A(from_input_req[35]), .Y(fin_req_i[35]))
	BUFX1 U36(.A(from_input_req[36]), .Y(fin_req_i[36]))

    MUX21X1 U0012 (.IN1(from_input_req[vc_ch_act_in * 37]), .IN2(fin_req_i[0]), .S(req_in), .Q(from_input_req[vc_ch_act_in * 37]));
    MUX21X1 U0013 (.IN1(from_input_req[vc_ch_act_in*37+2]), .IN2(vc_ch_act_in[1]), .S(req_in), .Q(from_input_req[vc_ch_act_in*37+2]));
    MUX21X1 U0014 (.IN1(from_input_req[vc_ch_act_in*37+1]), .IN2(vc_ch_act_in[0]), .S(req_in), .Q(from_input_req[vc_ch_act_in*37+1]));
    MUX21X1 U0015 (.IN1(fin_resp_o[0]), .IN2(from_input_resp[vc_ch_act_in]), .S(req_in), .Q(fin_resp_o[0]));

    INVX1 U041 ( .A(req_in), .Y(req_in_not) );
    MUX21X1 U0016 (.IN1(fin_resp_o[0]), .IN2(1'sb1), .S(req_in_not), .Q(fin_resp_o[0]));
    BUFX1 U34(.A(from_input_req[34]), .Y(fin_req_i[34]))

    XOR2X1 U0222 ( .IN1(_sv2v_jump[1]), .IN2(1'b1), .Q(xor1resu) );
    MUX21X1 U0017 (.IN1(_sv2v_jump[0]), .IN2(1'b0), .S(xor1resu), .Q(_sv2v_jump[0]));
    MUX21X1 U0018 (.IN1(_sv2v_jump[1]), .IN2(1'b0), .S(xor1resu), .Q(_sv2v_jump[1]));
    AND2X1 U38123 ( .IN1(xor1resu), .IN2(to_output_req[j*37]), .Q(and2resu) );
    MUX21X1 U0019 (.IN1(vc_ch_act_out[0]), .IN2(j[0]), .S(and2resu), .Q(vc_ch_act_out[0]));
    MUX21X1 U0020 (.IN1(vc_ch_act_out[1]), .IN2(j[1]), .S(and2resu), .Q(vc_ch_act_out[1]));
    MUX21X1 U0021 (.IN1(req_out), .IN2(1'b1), .S(and2resu), .Q(req_out));
    MUX21X1 U0022 (.IN1(_sv2v_jump[0]), .IN2(1'b0), .S(and2resu), .Q(_sv2v_jump[0]));
    MUX21X1 U0023 (.IN1(_sv2v_jump[1]), .IN2(1'b1), .S(and2resu), .Q(_sv2v_jump[1]));
    HADDX1 U00021 ( .A0(j[0]), .B0(1'b1), .C1(j[1]), .SO(j[0]) );
    HADDX1 U00022 ( .A0(j[0]), .B0(1'b1), .C1(j[1]), .SO(j[0]) );
    AND2X1 U38111 ( .IN1(xor1resu), .IN2(to_output_req[j*37]), .Q(and3resu) );
    NAND2X1 U29311(.A(_sv2v_jump[0]),.B(_sv2v_jump[1]),.Y(nand1resu));
    MUX21X1 U00212 (.IN1(_sv2v_jump[0]), .IN2(1'b0), .S(nand1resu), .Q(_sv2v_jump[0]));
    MUX21X1 U00213 (.IN1(_sv2v_jump[1]), .IN2(1'b0), .S(nand1resu), .Q(_sv2v_jump[1]));
    XNOR2X1 U17581 (.IN1(_sv2v_jump[0]), .IN2(_sv2v_jump[1]), .Q(xnor23resu) );
    AND2X1 U38111 ( .IN1(xnor23resu), .IN2(req_out), .Q(and4resu) );

    MUX21X1 U3(.IN1(to_output_req[(vc_ch_act_ouot*37)+3]),.IN2(fout_req_o[3]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+3]))
	MUX21X1 U4(.IN1(to_output_req[(vc_ch_act_ouot*37)+4]),.IN2(fout_req_o[4]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+4]))
	MUX21X1 U5(.IN1(to_output_req[(vc_ch_act_ouot*37)+5]),.IN2(fout_req_o[5]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+5]))
	MUX21X1 U6(.IN1(to_output_req[(vc_ch_act_ouot*37)+6]),.IN2(fout_req_o[6]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+6]))
	MUX21X1 U7(.IN1(to_output_req[(vc_ch_act_ouot*37)+7]),.IN2(fout_req_o[7]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+7]))
	MUX21X1 U8(.IN1(to_output_req[(vc_ch_act_ouot*37)+8]),.IN2(fout_req_o[8]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+8]))
	MUX21X1 U9(.IN1(to_output_req[(vc_ch_act_ouot*37)+9]),.IN2(fout_req_o[9]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+9]))
	MUX21X1 U10(.IN1(to_output_req[(vc_ch_act_ouot*37)+10]),.IN2(fout_req_o[10]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+10]))
	MUX21X1 U11(.IN1(to_output_req[(vc_ch_act_ouot*37)+11]),.IN2(fout_req_o[11]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+11]))
	MUX21X1 U12(.IN1(to_output_req[(vc_ch_act_ouot*37)+12]),.IN2(fout_req_o[12]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+12]))
	MUX21X1 U13(.IN1(to_output_req[(vc_ch_act_ouot*37)+13]),.IN2(fout_req_o[13]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+13]))
	MUX21X1 U14(.IN1(to_output_req[(vc_ch_act_ouot*37)+14]),.IN2(fout_req_o[14]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+14]))
	MUX21X1 U15(.IN1(to_output_req[(vc_ch_act_ouot*37)+15]),.IN2(fout_req_o[15]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+15]))
	MUX21X1 U16(.IN1(to_output_req[(vc_ch_act_ouot*37)+16]),.IN2(fout_req_o[16]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+16]))
	MUX21X1 U17(.IN1(to_output_req[(vc_ch_act_ouot*37)+17]),.IN2(fout_req_o[17]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+17]))
	MUX21X1 U18(.IN1(to_output_req[(vc_ch_act_ouot*37)+18]),.IN2(fout_req_o[18]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+18]))
	MUX21X1 U19(.IN1(to_output_req[(vc_ch_act_ouot*37)+19]),.IN2(fout_req_o[19]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+19]))
	MUX21X1 U20(.IN1(to_output_req[(vc_ch_act_ouot*37)+20]),.IN2(fout_req_o[20]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+20]))
	MUX21X1 U21(.IN1(to_output_req[(vc_ch_act_ouot*37)+21]),.IN2(fout_req_o[21]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+21]))
	MUX21X1 U22(.IN1(to_output_req[(vc_ch_act_ouot*37)+22]),.IN2(fout_req_o[22]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+22]))
	MUX21X1 U23(.IN1(to_output_req[(vc_ch_act_ouot*37)+23]),.IN2(fout_req_o[23]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+23]))
	MUX21X1 U24(.IN1(to_output_req[(vc_ch_act_ouot*37)+24]),.IN2(fout_req_o[24]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+24]))
	MUX21X1 U25(.IN1(to_output_req[(vc_ch_act_ouot*37)+25]),.IN2(fout_req_o[25]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+25]))
	MUX21X1 U26(.IN1(to_output_req[(vc_ch_act_ouot*37)+26]),.IN2(fout_req_o[26]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+26]))
	MUX21X1 U27(.IN1(to_output_req[(vc_ch_act_ouot*37)+27]),.IN2(fout_req_o[27]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+27]))
	MUX21X1 U28(.IN1(to_output_req[(vc_ch_act_ouot*37)+28]),.IN2(fout_req_o[28]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+28]))
	MUX21X1 U29(.IN1(to_output_req[(vc_ch_act_ouot*37)+29]),.IN2(fout_req_o[29]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+29]))
	MUX21X1 U30(.IN1(to_output_req[(vc_ch_act_ouot*37)+30]),.IN2(fout_req_o[30]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+30]))
	MUX21X1 U31(.IN1(to_output_req[(vc_ch_act_ouot*37)+31]),.IN2(fout_req_o[31]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+31]))
	MUX21X1 U32(.IN1(to_output_req[(vc_ch_act_ouot*37)+32]),.IN2(fout_req_o[32]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+32]))
	MUX21X1 U33(.IN1(to_output_req[(vc_ch_act_ouot*37)+33]),.IN2(fout_req_o[33]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+33]))
	MUX21X1 U34(.IN1(to_output_req[(vc_ch_act_ouot*37)+34]),.IN2(fout_req_o[34]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+34]))
	MUX21X1 U35(.IN1(to_output_req[(vc_ch_act_ouot*37)+35]),.IN2(fout_req_o[35]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+35]))
	MUX21X1 U36(.IN1(to_output_req[(vc_ch_act_ouot*37)+36]),.IN2(fout_req_o[36]), .S(and4resu), .Q(to_output_req[(vc_ch_act_ouot*37)+36]))

	MUX21X1 U321111(.IN1(fout_req_o[0]),.IN2(to_output_req[(vc_ch_act_out * 37)]), .S(and4resu), .Q(fout_req_o[0]))
	MUX21X1 U331112(.IN1(fout_req_o[1]),.IN2(to_output_req[(vc_ch_act_out*37)+1]), .S(and4resu), .Q(to_output_req[(vc_ch_act_out*37)+1]))
	MUX21X1 U331122(.IN1(fout_req_o[2]),.IN2(to_output_req[(vc_ch_act_out*37)+2]), .S(and4resu), .Q(to_output_req[(vc_ch_act_out*37)+2]))
	MUX21X1 U352221(.IN1(to_output_resp[vc_ch_act_out]),.IN2(fout_resp_i), .S(and4resu), .Q(to_output_resp[vc_ch_act_out]))
	MUX21X1 U352221(.IN1(to_output_resp[vc_ch_act_out+1]),.IN2(fout_resp_i), .S(and4resu), .Q(to_output_resp[vc_ch_act_out+1]))
endmodule
