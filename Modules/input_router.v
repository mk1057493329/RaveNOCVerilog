module input_router (clk,arst,flit_input_router_req_i,router_port_o);

	wire [8:0] routing_table_ff_input_router;
	wire [2:0] next_rt_input_router;
	wire [33:0] flit_input_router;
	wire new_rt_input_router,new_rt_input_routernot,norres_1_input_router,norres_2_input_router,norres_3_input_router,andfinres_input_router,and2result_input_router,norres_4_input_router,invres1_input_router,invres2_input_router,and3result_input_router,and4result_input_router,and5result_input_router,norres_5_input_router,and6result_input_router,and7result_input_router,and8result_input_router,and9result_input_router,and10result_input_router,and11result_input_router,orres1_input_router,orres2_input_router,orres3_input_router,finand1_input_router,finand2_input_router,finand3_input_router,nextrt2not_input_router,secondAndc_input_router,norres_5_input_router_2,and62result_input_router,and7result_input_router2,orres1_input_router2,finand1_input_router2,finand2_input_router2,and8result_input_router2,orres2_input_router2,and9result_input_router2,orres3_input_router2,finand3_input_router2,and11result_input_router2,nextrt2not_input_router,and10result_input_router2,arst_valuenot_input_router,finand3_input_router22;

    BUFX1 U00 ( .A(1'b0), .Y(next_rt_input_router[0]) );
    BUFX1 U01 ( .A(1'b0), .Y(next_rt_input_router[1]) );
    BUFX1 U02 ( .A(1'b0), .Y(next_rt_input_router[2]) );
    BUFX1 U3(.A(flit_input_router_req_i[3]), .Y(flit_input_router[3]))
	BUFX1 U4(.A(flit_input_router_req_i[4]), .Y(flit_input_router[4]))
	BUFX1 U5(.A(flit_input_router_req_i[5]), .Y(flit_input_router[5]))
	BUFX1 U6(.A(flit_input_router_req_i[6]), .Y(flit_input_router[6]))
	BUFX1 U7(.A(flit_input_router_req_i[7]), .Y(flit_input_router[7]))
	BUFX1 U8(.A(flit_input_router_req_i[8]), .Y(flit_input_router[8]))
	BUFX1 U9(.A(flit_input_router_req_i[9]), .Y(flit_input_router[9]))
	BUFX1 U10(.A(flit_input_router_req_i[10]), .Y(flit_input_router[10]))
	BUFX1 U11(.A(flit_input_router_req_i[11]), .Y(flit_input_router[11]))
	BUFX1 U12(.A(flit_input_router_req_i[12]), .Y(flit_input_router[12]))
	BUFX1 U13(.A(flit_input_router_req_i[13]), .Y(flit_input_router[13]))
	BUFX1 U14(.A(flit_input_router_req_i[14]), .Y(flit_input_router[14]))
	BUFX1 U15(.A(flit_input_router_req_i[15]), .Y(flit_input_router[15]))
	BUFX1 U16(.A(flit_input_router_req_i[16]), .Y(flit_input_router[16]))
	BUFX1 U17(.A(flit_input_router_req_i[17]), .Y(flit_input_router[17]))
	BUFX1 U18(.A(flit_input_router_req_i[18]), .Y(flit_input_router[18]))
	BUFX1 U19(.A(flit_input_router_req_i[19]), .Y(flit_input_router[19]))
	BUFX1 U20(.A(flit_input_router_req_i[20]), .Y(flit_input_router[20]))
	BUFX1 U21(.A(flit_input_router_req_i[21]), .Y(flit_input_router[21]))
	BUFX1 U22(.A(flit_input_router_req_i[22]), .Y(flit_input_router[22]))
	BUFX1 U23(.A(flit_input_router_req_i[23]), .Y(flit_input_router[23]))
	BUFX1 U24(.A(flit_input_router_req_i[24]), .Y(flit_input_router[24]))
	BUFX1 U25(.A(flit_input_router_req_i[25]), .Y(flit_input_router[25]))
	BUFX1 U26(.A(flit_input_router_req_i[26]), .Y(flit_input_router[26]))
	BUFX1 U27(.A(flit_input_router_req_i[27]), .Y(flit_input_router[27]))
	BUFX1 U28(.A(flit_input_router_req_i[28]), .Y(flit_input_router[28]))
	BUFX1 U29(.A(flit_input_router_req_i[29]), .Y(flit_input_router[29]))
	BUFX1 U30(.A(flit_input_router_req_i[30]), .Y(flit_input_router[30]))
	BUFX1 U31(.A(flit_input_router_req_i[31]), .Y(flit_input_router[31]))
	BUFX1 U32(.A(flit_input_router_req_i[32]), .Y(flit_input_router[32]))
	BUFX1 U33(.A(flit_input_router_req_i[33]), .Y(flit_input_router[33]))
	BUFX1 U34(.A(flit_input_router_req_i[34]), .Y(flit_input_router[34]))
	BUFX1 U35(.A(flit_input_router_req_i[35]), .Y(flit_input_router[35]))
	BUFX1 U36(.A(flit_input_router_req_i[36]), .Y(flit_input_router[36]))

    NOR2X1 U37 ( .IN1(flit_input_router[33]), .IN2(flit_input_router[32]), .QN(norres_1_input_router) );
    AND2X1 U38 ( .IN1(flit_input_router_req_i[0]), .IN2(norres_1_input_router), .Q(new_rt_input_router) );

    NOR2X1 U37 ( .IN1(flit_input_router[31]), .IN2(1'b0), .QN(norres_2_input_router) );
    NOR2X1 U37 ( .IN1(flit_input_router[30]), .IN2(1'b0), .QN(norres_3_input_router) );
    AND3X1 U37 ( .IN1(new_rt_input_router), .IN2(norres_2_input_router), .IN3(norres_3_input_router), .Q(andfinres_input_router) );
    MUX21X1 U38 (.IN1(next_rt_input_router[0]), .IN2(1'b0), .S(andfinres_input_router), .Q(next_rt_input_router[0]);
    MUX21X1 U38 (.IN1(next_rt_input_router[1]), .IN2(1'b0), .S(andfinres_input_router), .Q(next_rt_input_router[1]);
    MUX21X1 U38 (.IN1(next_rt_input_router[2]), .IN2(1'b1), .S(andfinres_input_router), .Q(next_rt_input_router[2]);
    INVX1 U41 ( .A(andfinres_input_router), .Y(invres1_input_router) );


    AND3X1 U37 ( .IN1(new_rt_input_router), .IN2(norres_2_input_router), .IN3(invres1_input_router), .Q(and2result_input_router) );
    MUX21X1 U38 (.IN1(next_rt_input_router[0]), .IN2(1'b1), .S(and2result_input_router), .Q(next_rt_input_router[0]);
    MUX21X1 U38 (.IN1(next_rt_input_router[1]), .IN2(1'b1), .S(and2result_input_router), .Q(next_rt_input_router[1]);
    MUX21X1 U38 (.IN1(next_rt_input_router[2]), .IN2(1'b0), .S(and2result_input_router), .Q(next_rt_input_router[2]);
    INVX1 U41 ( .A(and2result_input_router), .Y(invres2_input_router) );

    AND3X1 U37 ( .IN1(new_rt_input_router), .IN2(invres1_input_router), .IN3(invres2_input_router), .Q(and3result_input_router) );
    AND2X1 U38 ( .IN1(flit_input_router[31]), .IN2(1'b1), .Q(and4result_input_router) );
    AND2X1 U38 ( .IN1(and4result_input_router), .IN2(and3result_input_router), .Q(and5result_input_router) );

    MUX21X1 U38 (.IN1(1'b0), .IN2(1'b1), .S(and5result_input_router), .Q(next_rt_input_router[0]);
    MUX21X1 U38 (.IN1(1'b0), .IN2(1'b0), .S(and5result_input_router), .Q(next_rt_input_router[1]);
    MUX21X1 U38 (.IN1(1'b0), .IN2(1'b0), .S(and5result_input_router), .Q(next_rt_input_router[2]);

   	BUFX1 U35(.A(1'sb0), .Y(router_port_o[0]))
   	BUFX1 U35(.A(1'sb0), .Y(router_port_o[1]))
   	BUFX1 U35(.A(1'sb0), .Y(router_port_o[2]))
   	BUFX1 U35(.A(1'sb0), .Y(router_port_o[3]))
   	BUFX1 U35(.A(1'sb0), .Y(router_port_o[4]))

    NOR3X1 U37 ( .IN1(next_rt_input_router[0]), .IN2(next_rt_input_router[1]), .IN2(next_rt_input_router[2]), .QN(norres_5_input_router) );
    AND2X1 U38 ( .IN1(norres_5_input_router), .IN2(new_rt_input_router), .Q(and6result_input_router) );
    MUX21X1 U38 (.IN1(router_port_o[0]), .IN2(1'sb1), .S(and6result_input_router), .Q(router_port_o[4]);

    //1,2,4 and + or
    NOR2X1 U38 ( .IN1(next_rt_input_router[1]), .IN2(next_rt_input_router[2]), .QN(and7result_input_router) );
    AND2X1 U19 ( .IN1(and7result_input_router), .IN2(next_rt_input_router[0]), .Y(orres1_input_router) );
    AND2X1 U38 ( .IN1(new_rt_input_router), .IN2(orres1_input_router), .Q(finand1_input_router) );
    MUX21X1 U38 (.IN1(router_port_o[3]), .IN2(1'sb1), .S(finand1_input_router), .Q(router_port_o[3]);

    NOR2X1 U38 ( .IN1(next_rt_input_router[0]), .IN2(next_rt_input_router[2]), .Q(and8result_input_router) );
    AND2X1 U19 ( .IN1(and8result_input_router), .IN2(next_rt_input_router[1]), .Y(orres2_input_router) );
    AND2X1 U38 ( .IN1(new_rt_input_router), .IN2(orres2_input_router), .Q(finand2_input_router) );
    MUX21X1 U38 (.IN1(router_port_o[2]), .IN2(1'sb1), .S(finand2_input_router), .Q(router_port_o[2]);

    NOR2X1 U38 ( .IN1(next_rt_input_router[0]), .IN2(next_rt_input_router[1]), .Q(and9result_input_router) );
    AND2X1 U19 ( .IN1(and9result_input_router), .IN2(next_rt_input_router[2]), .Y(orres3_input_router) );
    AND2X1 U38 ( .IN1(new_rt_input_router), .IN2(orres3_input_router), .Q(finand3_input_router) );
    MUX21X1 U38 (.IN1(router_port_o[0]), .IN2(1'sb1), .S(finand3_input_router), .Q(router_port_o[0]);

    AND2X1 U38 ( .IN1(next_rt_input_router[0]), .IN2(next_rt_input_router[1]), .Q(and10result_input_router) );
    INVX1 U41 ( .A(next_rt_input_router[2]), .Y(nextrt2not_input_router) );
    AND2X1 U38 ( .IN1(nextrt2not_input_router), .IN2(and10result_input_router), .Q(and11result_input_router) );
    MUX21X1 U38 (.IN1(router_port_o[1]), .IN2(1'sb1), .S(and11result_input_router), .Q(router_port_o[1]);

    INVX1 U41 ( .A(new_rt_input_router), .Y(new_rt_input_routernot) );
    AND2X1 U38 ( .IN1(new_rt_input_routernot), .IN2(flit_input_router_req_i[0]), .Q(secondAndc_input_router) );

    NOR3X1 U37 ( .IN1(routing_table_ff_input_router[flit_input_router_req_i[2]*3]), .IN2(routing_table_ff_input_router[flit_input_router_req_i[2]*3+1]), .IN2(routing_table_ff_input_router[flit_input_router_req_i[2]*3+2]), .QN(norres_5_input_router_2) );
    AND2X1 U38 ( .IN1(norres_5_input_router_2), .IN2(newsecondAndc_input_router_rt), .Q(and62result_input_router) );
    MUX21X1 U38 (.IN1(router_port_o[0]), .IN2(1'sb1), .S(and62result_input_router), .Q(router_port_o[4]);

    NOR2X1 U38 ( .IN1(routing_table_ff_input_router[flit_input_router_req_i[2]*3+1]), .IN2(routing_table_ff_input_router[flit_input_router_req_i[2]*3+2]), .QN(and7result_input_router2) );
    AND2X1 U19 ( .IN1(and7result_input_router2), .IN2(routing_table_ff_input_router[flit_input_router_req_i[2]*3]), .Y(orres1_input_router2) );
    AND2X1 U38 ( .IN1(new_rt_input_routernot), .IN2(orres1_input_router2), .Q(finand1_input_router2) );
    MUX21X1 U38 (.IN1(router_port_o[3]), .IN2(1'sb1), .S(finand1_input_router2), .Q(router_port_o[3]);

    NOR2X1 U38 ( .IN1(routing_table_ff_input_router[flit_input_router_req_i[2]*3]), .IN2(routing_table_ff_input_router[flit_input_router_req_i[2]*3+2]), .Q(and8result_input_router2) );
    AND2X1 U19 ( .IN1(and8result_input_router2), .IN2(routing_table_ff_input_router[flit_input_router_req_i[2]*3+1]), .Y(orres2_input_router2) );
    AND2X1 U38 ( .IN1(new_rt_input_routernot), .IN2(orres2_input_router), .Q(finand2_input_router2) );
    MUX21X1 U38 (.IN1(router_port_o[2]), .IN2(1'sb1), .S(finand2_input_router2), .Q(router_port_o[2]);

    NOR2X1 U38 ( .IN1(routing_table_ff_input_router[flit_input_router_req_i[2]*3]), .IN2(routing_table_ff_input_router[flit_input_router_req_i[2]*3+1]), .Q(and9result_input_router2) );
    AND2X1 U19 ( .IN1(and9result_input_router2), .IN2(routing_table_ff_input_router[flit_input_router_req_i[2]*3+2]), .Y(orres3_input_router2) );
    AND2X1 U38 ( .IN1(new_rt_input_routernot), .IN2(orres3_input_router2), .Q(finand3_input_router2) );
    MUX21X1 U38 (.IN1(router_port_o[0]), .IN2(1'sb1), .S(finand3_input_router2), .Q(router_port_o[0]);

    AND2X1 U38 ( .IN1(routing_table_ff_input_router[flit_input_router_req_i[2]*3]), .IN2(routing_table_ff_input_router[flit_input_router_req_i[2]*3+1]), .Q(and10result_input_router2) );
    INVX1 U41 ( .A(routing_table_ff_input_router[flit_input_router_req_i[2]*3+2]), .Y(nextrt2not_input_router) );
    AND3X1 U38 ( .IN1(nextrt2not_input_router), .IN2(and10result_input_router2), .IN3(new_rt_input_routernot), .Q(and11result_input_router2) );
    MUX21X1 U38 (.IN1(router_port_o[1]), .IN2(1'sb1), .S(and11result_input_router), .Q(router_port_o[1]);

    DFFX2 U49 ( .CLK(clk), .D(arst), .Q(arst_value) );
    DFFX2 U50 ( .CLK(arst), .D(arst), .Q(arst_value) );
    MUX21X1 U51 (.IN1(routing_table_ff_input_router[0]), .IN2(1'sb0), .S(arst_value), .Q(routing_table_ff_input_router[0]);
    MUX21X1 U51 (.IN1(routing_table_ff_input_router[1]), .IN2(1'sb0), .S(arst_value), .Q(routing_table_ff_input_router[1]);
    MUX21X1 U51 (.IN1(routing_table_ff_input_router[2]), .IN2(1'sb0), .S(arst_value), .Q(routing_table_ff_input_router[2]);
    MUX21X1 U51 (.IN1(routing_table_ff_input_router[3]), .IN2(1'sb0), .S(arst_value), .Q(routing_table_ff_input_router[3]);
    MUX21X1 U51 (.IN1(routing_table_ff_input_router[4]), .IN2(1'sb0), .S(arst_value), .Q(routing_table_ff_input_router[4]);
    MUX21X1 U51 (.IN1(routing_table_ff_input_router[5]), .IN2(1'sb0), .S(arst_value), .Q(routing_table_ff_input_router[5]);
    MUX21X1 U51 (.IN1(routing_table_ff_input_router[6]), .IN2(1'sb0), .S(arst_value), .Q(routing_table_ff_input_router[6]);
    MUX21X1 U51 (.IN1(routing_table_ff_input_router[7]), .IN2(1'sb0), .S(arst_value), .Q(routing_table_ff_input_router[7]);
    MUX21X1 U51 (.IN1(routing_table_ff_input_router[8]), .IN2(1'sb0), .S(arst_value), .Q(routing_table_ff_input_router[8]);
    INVX1 U41 ( .A(arst_value), .Y(arst_valuenot_input_router) );
    AND2X1 U38 ( .IN1(new_rt_input_router), .IN2(arst_valuenot_input_router), .Q(finand3_input_router22) );
    MUX21X1 U51 (.IN1(routing_table_ff_input_router[flit_input_router_req_i[2]*3]), .IN2(next_rt_input_router[0]), .S(finand3_input_router22), .Q(routing_table_ff_input_router[flit_input_router_req_i[2]*3]);
    MUX21X1 U51 (.IN1(routing_table_ff_input_router[flit_input_router_req_i[2]*3+1]), .IN2(next_rt_input_router[1]), .S(finand3_input_router22), .Q(routing_table_ff_input_router[flit_input_router_req_i[2]*3+1]);
    MUX21X1 U51 (.IN1(routing_table_ff_input_router[flit_input_router_req_i[2]*3+2]), .IN2(next_rt_input_router[2]), .S(finand3_input_router22), .Q(routing_table_ff_input_router[flit_input_router_req_i[2]*3+2]);    
endmodule
