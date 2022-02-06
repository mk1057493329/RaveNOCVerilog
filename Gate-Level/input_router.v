module input_router (clk,arst,flit_req_i,router_port_o);
	input clk;
	input arst;
	input wire [36:0] flit_req_i;
	output [4:0] router_port_o;
	wire [8:0] routing_table_ff;
	wire [2:0] next_rt;
	wire [33:0] flit;
	wire new_rt,new_rtnot,norres_1,norres_2,norres_3,andfinres,and2result,norres_4,invres1,invres2,and3result,and4result,and5result,norres_5,and6result,and7result,and8result,and9result,and10result,and11result,orres1,orres2,orres3,finand1,finand2,finand3,nextrt2not,secondAndc,norres_5_2,and62result,and7result2,orres12,finand12,finand22,and8result2,orres22,and9result2,orres32,finand32,and11result2,nextrt2not,and10result2,arst_valuenot,finand322;

    BUFX1 U00 ( .A(1'b0), .Y(next_rt[0]) );
    BUFX1 U01 ( .A(1'b0), .Y(next_rt[1]) );
    BUFX1 U02 ( .A(1'b0), .Y(next_rt[2]) );
    BUFX1 U3(.A(flit_req_i[3]), .Y(flit[3]))
	BUFX1 U4(.A(flit_req_i[4]), .Y(flit[4]))
	BUFX1 U5(.A(flit_req_i[5]), .Y(flit[5]))
	BUFX1 U6(.A(flit_req_i[6]), .Y(flit[6]))
	BUFX1 U7(.A(flit_req_i[7]), .Y(flit[7]))
	BUFX1 U8(.A(flit_req_i[8]), .Y(flit[8]))
	BUFX1 U9(.A(flit_req_i[9]), .Y(flit[9]))
	BUFX1 U10(.A(flit_req_i[10]), .Y(flit[10]))
	BUFX1 U11(.A(flit_req_i[11]), .Y(flit[11]))
	BUFX1 U12(.A(flit_req_i[12]), .Y(flit[12]))
	BUFX1 U13(.A(flit_req_i[13]), .Y(flit[13]))
	BUFX1 U14(.A(flit_req_i[14]), .Y(flit[14]))
	BUFX1 U15(.A(flit_req_i[15]), .Y(flit[15]))
	BUFX1 U16(.A(flit_req_i[16]), .Y(flit[16]))
	BUFX1 U17(.A(flit_req_i[17]), .Y(flit[17]))
	BUFX1 U18(.A(flit_req_i[18]), .Y(flit[18]))
	BUFX1 U19(.A(flit_req_i[19]), .Y(flit[19]))
	BUFX1 U20(.A(flit_req_i[20]), .Y(flit[20]))
	BUFX1 U21(.A(flit_req_i[21]), .Y(flit[21]))
	BUFX1 U22(.A(flit_req_i[22]), .Y(flit[22]))
	BUFX1 U23(.A(flit_req_i[23]), .Y(flit[23]))
	BUFX1 U24(.A(flit_req_i[24]), .Y(flit[24]))
	BUFX1 U25(.A(flit_req_i[25]), .Y(flit[25]))
	BUFX1 U26(.A(flit_req_i[26]), .Y(flit[26]))
	BUFX1 U27(.A(flit_req_i[27]), .Y(flit[27]))
	BUFX1 U28(.A(flit_req_i[28]), .Y(flit[28]))
	BUFX1 U29(.A(flit_req_i[29]), .Y(flit[29]))
	BUFX1 U30(.A(flit_req_i[30]), .Y(flit[30]))
	BUFX1 U31(.A(flit_req_i[31]), .Y(flit[31]))
	BUFX1 U32(.A(flit_req_i[32]), .Y(flit[32]))
	BUFX1 U33(.A(flit_req_i[33]), .Y(flit[33]))
	BUFX1 U34(.A(flit_req_i[34]), .Y(flit[34]))
	BUFX1 U35(.A(flit_req_i[35]), .Y(flit[35]))
	BUFX1 U36(.A(flit_req_i[36]), .Y(flit[36]))

    NOR2X1 U37 ( .IN1(flit[33]), .IN2(flit[32]), .QN(norres_1) );
    AND2X1 U38 ( .IN1(flit_req_i[0]), .IN2(norres_1), .Q(new_rt) );

    NOR2X1 U37 ( .IN1(flit[31]), .IN2(1'b0), .QN(norres_2) );
    NOR2X1 U37 ( .IN1(flit[30]), .IN2(1'b0), .QN(norres_3) );
    AND3X1 U37 ( .IN1(new_rt), .IN2(norres_2), .IN3(norres_3), .Q(andfinres) );
    MUX21X1 U38 (.IN1(next_rt[0]), .IN2(1'b0), .S(andfinres), .Q(next_rt[0]);
    MUX21X1 U38 (.IN1(next_rt[1]), .IN2(1'b0), .S(andfinres), .Q(next_rt[1]);
    MUX21X1 U38 (.IN1(next_rt[2]), .IN2(1'b1), .S(andfinres), .Q(next_rt[2]);
    INVX1 U41 ( .A(andfinres), .Y(invres1) );


    AND3X1 U37 ( .IN1(new_rt), .IN2(norres_2), .IN3(invres1), .Q(and2result) );
    MUX21X1 U38 (.IN1(next_rt[0]), .IN2(1'b1), .S(and2result), .Q(next_rt[0]);
    MUX21X1 U38 (.IN1(next_rt[1]), .IN2(1'b1), .S(and2result), .Q(next_rt[1]);
    MUX21X1 U38 (.IN1(next_rt[2]), .IN2(1'b0), .S(and2result), .Q(next_rt[2]);
    INVX1 U41 ( .A(and2result), .Y(invres2) );

    AND3X1 U37 ( .IN1(new_rt), .IN2(invres1), .IN3(invres2), .Q(and3result) );
    AND2X1 U38 ( .IN1(flit[31]), .IN2(1'b1), .Q(and4result) );
    AND2X1 U38 ( .IN1(and4result), .IN2(and3result), .Q(and5result) );

    MUX21X1 U38 (.IN1(1'b0), .IN2(1'b1), .S(and5result), .Q(next_rt[0]);
    MUX21X1 U38 (.IN1(1'b0), .IN2(1'b0), .S(and5result), .Q(next_rt[1]);
    MUX21X1 U38 (.IN1(1'b0), .IN2(1'b0), .S(and5result), .Q(next_rt[2]);

   	BUFX1 U35(.A(1'sb0), .Y(router_port_o[0]))
   	BUFX1 U35(.A(1'sb0), .Y(router_port_o[1]))
   	BUFX1 U35(.A(1'sb0), .Y(router_port_o[2]))
   	BUFX1 U35(.A(1'sb0), .Y(router_port_o[3]))
   	BUFX1 U35(.A(1'sb0), .Y(router_port_o[4]))

    NOR3X1 U37 ( .IN1(next_rt[0]), .IN2(next_rt[1]), .IN2(next_rt[2]), .QN(norres_5) );
    AND2X1 U38 ( .IN1(norres_5), .IN2(new_rt), .Q(and6result) );
    MUX21X1 U38 (.IN1(router_port_o[0]), .IN2(1'sb1), .S(and6result), .Q(router_port_o[4]);

    //1,2,4 and + or
    NOR2X1 U38 ( .IN1(next_rt[1]), .IN2(next_rt[2]), .QN(and7result) );
    AND2X1 U19 ( .IN1(and7result), .IN2(next_rt[0]), .Y(orres1) );
    AND2X1 U38 ( .IN1(new_rt), .IN2(orres1), .Q(finand1) );
    MUX21X1 U38 (.IN1(router_port_o[3]), .IN2(1'sb1), .S(finand1), .Q(router_port_o[3]);

    NOR2X1 U38 ( .IN1(next_rt[0]), .IN2(next_rt[2]), .Q(and8result) );
    AND2X1 U19 ( .IN1(and8result), .IN2(next_rt[1]), .Y(orres2) );
    AND2X1 U38 ( .IN1(new_rt), .IN2(orres2), .Q(finand2) );
    MUX21X1 U38 (.IN1(router_port_o[2]), .IN2(1'sb1), .S(finand2), .Q(router_port_o[2]);

    NOR2X1 U38 ( .IN1(next_rt[0]), .IN2(next_rt[1]), .Q(and9result) );
    AND2X1 U19 ( .IN1(and9result), .IN2(next_rt[2]), .Y(orres3) );
    AND2X1 U38 ( .IN1(new_rt), .IN2(orres3), .Q(finand3) );
    MUX21X1 U38 (.IN1(router_port_o[0]), .IN2(1'sb1), .S(finand3), .Q(router_port_o[0]);

    AND2X1 U38 ( .IN1(next_rt[0]), .IN2(next_rt[1]), .Q(and10result) );
    INVX1 U41 ( .A(next_rt[2]), .Y(nextrt2not) );
    AND2X1 U38 ( .IN1(nextrt2not), .IN2(and10result), .Q(and11result) );
    MUX21X1 U38 (.IN1(router_port_o[1]), .IN2(1'sb1), .S(and11result), .Q(router_port_o[1]);

    INVX1 U41 ( .A(new_rt), .Y(new_rtnot) );
    AND2X1 U38 ( .IN1(new_rtnot), .IN2(flit_req_i[0]), .Q(secondAndc) );

    NOR3X1 U37 ( .IN1(routing_table_ff[flit_req_i[2]*3]), .IN2(routing_table_ff[flit_req_i[2]*3+1]), .IN2(routing_table_ff[flit_req_i[2]*3+2]), .QN(norres_5_2) );
    AND2X1 U38 ( .IN1(norres_5_2), .IN2(newsecondAndc_rt), .Q(and62result) );
    MUX21X1 U38 (.IN1(router_port_o[0]), .IN2(1'sb1), .S(and62result), .Q(router_port_o[4]);

    NOR2X1 U38 ( .IN1(routing_table_ff[flit_req_i[2]*3+1]), .IN2(routing_table_ff[flit_req_i[2]*3+2]), .QN(and7result2) );
    AND2X1 U19 ( .IN1(and7result2), .IN2(routing_table_ff[flit_req_i[2]*3]), .Y(orres12) );
    AND2X1 U38 ( .IN1(new_rtnot), .IN2(orres12), .Q(finand12) );
    MUX21X1 U38 (.IN1(router_port_o[3]), .IN2(1'sb1), .S(finand12), .Q(router_port_o[3]);

    NOR2X1 U38 ( .IN1(routing_table_ff[flit_req_i[2]*3]), .IN2(routing_table_ff[flit_req_i[2]*3+2]), .Q(and8result2) );
    AND2X1 U19 ( .IN1(and8result2), .IN2(routing_table_ff[flit_req_i[2]*3+1]), .Y(orres22) );
    AND2X1 U38 ( .IN1(new_rtnot), .IN2(orres2), .Q(finand22) );
    MUX21X1 U38 (.IN1(router_port_o[2]), .IN2(1'sb1), .S(finand22), .Q(router_port_o[2]);

    NOR2X1 U38 ( .IN1(routing_table_ff[flit_req_i[2]*3]), .IN2(routing_table_ff[flit_req_i[2]*3+1]), .Q(and9result2) );
    AND2X1 U19 ( .IN1(and9result2), .IN2(routing_table_ff[flit_req_i[2]*3+2]), .Y(orres32) );
    AND2X1 U38 ( .IN1(new_rtnot), .IN2(orres32), .Q(finand32) );
    MUX21X1 U38 (.IN1(router_port_o[0]), .IN2(1'sb1), .S(finand32), .Q(router_port_o[0]);

    AND2X1 U38 ( .IN1(routing_table_ff[flit_req_i[2]*3]), .IN2(routing_table_ff[flit_req_i[2]*3+1]), .Q(and10result2) );
    INVX1 U41 ( .A(routing_table_ff[flit_req_i[2]*3+2]), .Y(nextrt2not) );
    AND3X1 U38 ( .IN1(nextrt2not), .IN2(and10result2), .IN3(new_rtnot), .Q(and11result2) );
    MUX21X1 U38 (.IN1(router_port_o[1]), .IN2(1'sb1), .S(and11result), .Q(router_port_o[1]);

    DFFX2 U49 ( .CLK(clk), .D(arst), .Q(arst_value) );
    DFFX2 U50 ( .CLK(arst), .D(arst), .Q(arst_value) );
    MUX21X1 U51 (.IN1(routing_table_ff[0]), .IN2(1'sb0), .S(arst_value), .Q(routing_table_ff[0]);
    MUX21X1 U51 (.IN1(routing_table_ff[1]), .IN2(1'sb0), .S(arst_value), .Q(routing_table_ff[1]);
    MUX21X1 U51 (.IN1(routing_table_ff[2]), .IN2(1'sb0), .S(arst_value), .Q(routing_table_ff[2]);
    MUX21X1 U51 (.IN1(routing_table_ff[3]), .IN2(1'sb0), .S(arst_value), .Q(routing_table_ff[3]);
    MUX21X1 U51 (.IN1(routing_table_ff[4]), .IN2(1'sb0), .S(arst_value), .Q(routing_table_ff[4]);
    MUX21X1 U51 (.IN1(routing_table_ff[5]), .IN2(1'sb0), .S(arst_value), .Q(routing_table_ff[5]);
    MUX21X1 U51 (.IN1(routing_table_ff[6]), .IN2(1'sb0), .S(arst_value), .Q(routing_table_ff[6]);
    MUX21X1 U51 (.IN1(routing_table_ff[7]), .IN2(1'sb0), .S(arst_value), .Q(routing_table_ff[7]);
    MUX21X1 U51 (.IN1(routing_table_ff[8]), .IN2(1'sb0), .S(arst_value), .Q(routing_table_ff[8]);
    INVX1 U41 ( .A(arst_value), .Y(arst_valuenot) );
    AND2X1 U38 ( .IN1(new_rt), .IN2(arst_valuenot), .Q(finand322) );
    MUX21X1 U51 (.IN1(routing_table_ff[flit_req_i[2]*3]), .IN2(next_rt[0]), .S(finand322), .Q(routing_table_ff[flit_req_i[2]*3]);
    MUX21X1 U51 (.IN1(routing_table_ff[flit_req_i[2]*3+1]), .IN2(next_rt[1]), .S(finand322), .Q(routing_table_ff[flit_req_i[2]*3+1]);
    MUX21X1 U51 (.IN1(routing_table_ff[flit_req_i[2]*3+2]), .IN2(next_rt[2]), .S(finand322), .Q(routing_table_ff[flit_req_i[2]*3+2]);    
endmodule
