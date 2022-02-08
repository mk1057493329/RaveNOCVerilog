module high_prior_arbiter (req_i,grant_o,clk);

	input clk;
	input [1:0] req_i;
	output [1:0] grant_o;
	wire [0:1] _sv2v_jump;
    wire i,xnores,i_0_not,nandres;

    BUFX1 U00 ( .A(1'b0), .Y(_sv2v_jump[0]) );
    BUFX1 U01 ( .A(1'b0), .Y(_sv2v_jump[1]) );
    BUFX1 U02 ( .A(1'b0), .Y(grant_o[0]) );
    BUFX1 U03 ( .A(1'b0), .Y(grant_o[1]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(i[1]), .SO(i[0]) );
    XNOR2X1 U05 ( .IN1(_sv2v_jump[1]), .IN2(1'b0), .Q(xnores) );
    MUX21X1 U06 (.IN1(_sv2v_jump[0]), .IN2(1'b0), .S(xnores), .Q(_sv2v_jump[0]));
    MUX21X1 U07 (.IN1(_sv2v_jump[1]), .IN2(1'b0), .S(xnores), .Q(_sv2v_jump[1]));
	INVX1 U08 ( .A(i[0]), .Y(i_0_not) );
	MUX21X1 U09 (.IN1(grant_o[0]), .IN2(i_0_not), .S(req_i[i[0]]), .Q(grant_o[0]);
	MUX21X1 U10 (.IN1(grant_o[1]), .IN2(i[0]), .S(req_i[i[0]]), .Q(grant_o[1]);
	MUX21X1 U11 (.IN1(_sv2v_jump[0]), .IN2(1'b0), .S(req_i[i[0]]), .Q(_sv2v_jump[0]));
	MUX21X1 U12 (.IN1(_sv2v_jump[1]), .IN2(1'b1), .S(req_i[i[0]]), .Q(_sv2v_jump[1]));
	NAND2X1 U13 (.IN1(_sv2v_jump[0]), .IN2(_sv2v_jump[1]), .QN(nandres) );
    MUX21X1 U14 (.IN1(_sv2v_jump[0]), .IN2(1'b0), .S(nandres), .Q(_sv2v_jump[0]));
    MUX21X1 U15 (.IN1(_sv2v_jump[1]), .IN2(1'b0), .S(nandres), .Q(_sv2v_jump[1]));
    HADDX1 U00021 ( .A0(i[0]), .B0(1'b1), .C1(i[1]), .SO(i[0]) );
    HADDX1 U00022 ( .A0(i[0]), .B0(1'b1), .C1(i[1]), .SO(i[0]) );
    HADDX1 U00021 ( .A0(i[0]), .B0(1'b1), .C1(i[1]), .SO(i[0]) );
endmodule