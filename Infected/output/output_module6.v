module output_module (clk,arst,fin_req_i,fin_resp_o,fout_req_o,fout_resp_i);
	input clk;
	input arst;
	input [148:0] fin_req_i;
	output [3:0] fin_resp_o;
	output [36:0] fout_req_o;
	input fout_resp_i;
	wire [11:0] valid_from_im_output_module;
	wire [11:0] grant_im_output_module;
	wire [2:0] tail_flit_im_output_module;
	wire [1:0] vc_ch_act_out_output_module;
	wire req_out_output_module,xnor1resu1_output_module,xnor2resu1_output_module,and1resu1_output_module,xor1resu1_output_module,and2resu1_output_module,head_flit_output_module_32_not_output_module,and3resu1_output_module,nor23resu1_output_module,nor23resu2_output_module,and4resu1_output_module,and5resu1_output_module,or12resu12_output_module,nor23resu3_output_module,and6resu1_output_module,nand1resu_output_module,and8resu1_output_module,norfinresu1_output_module,and9resu1_output_module,and10resu1_output_module,and11resu1_output_module;
	wire [33:0] head_flit_output_module;
	wire [1:0] _sv2v_jump_output_module;
	wire [31:0] in_mod_output_module;
	wire [31:0] vc_channel_output_module;
	wire [1:0] _sv2v_jump_output_module_1;
	wire [31:0] i_output_module;
    wire [1:0] mask_ff_rr_arbiter, next_mask_rr_arbiter, mask_req_rr_arbiter, _sv2v_jump_rr_rr_arbiter, i_rr_arbiter, j_rr_arbiter, raw_grant_rr_arbiter, masked_grant_rr_arbiter, temp_mask_ff_rr_arbiter, _sv2v_jump_high_prior_arbiter1, i_high_prior_arbiter1, _sv2v_jump_high_prior_arbiter2, i_high_prior_arbiter2, mask_ff_rr_arbiter1, next_mask_rr_arbiter1, mask_req_rr_arbiter1, _sv2v_jump_rr_rr_arbiter1, i_rr_arbiter1, j_rr_arbiter1, raw_grant_rr_arbiter1, masked_grant_rr_arbiter1, temp_mask_ff_rr_arbiter11, _sv2v_jump_high_prior_arbiter11, i_high_prior_arbiter11, _sv2v_jump_high_prior_arbiter21, i_high_prior_arbiter21,mask_ff_rr_arbiter2,next_mask_rr_arbiter2,mask_req_rr_arbiter2,_sv2v_jump_rr_rr_arbiter2,i_rr_arbiter2,j_rr_arbiter2,raw_grant_rr_arbiter2,masked_grant_rr_arbiter2,temp_mask_ff_rr_arbiter22,_sv2v_jump_high_prior_arbiter12,i_high_prior_arbiter12,_sv2v_jump_high_prior_arbiter22,i_high_prior_arbiter22;

    wire xnores_high_prior_arbiter21,i_0_not_high_prior_arbiter21,nandres_high_prior_arbiter21,xnor0res_rr_arbiter,xnor1res_rr_arbiter,firstif_rr_arbiter,secondif_rr_arbiter,thirdif_rr_arbiter,fourthif_rr_arbiter,not_i_rr_arbiter,arst_value_rr_arbiter,xnores_high_prior_arbiter1,i_0_not_high_prior_arbiter1,nandres_high_prior_arbiter1,xnores_high_prior_arbiter2,i_0_not_high_prior_arbiter2,nandres_high_prior_arbiter2,xnor0res_rr_arbiter1,xnor1res_rr_arbiter1,firstif_rr_arbiter1,secondif_rr_arbiter1,thirdif_rr_arbiter1,fourthif_rr_arbiter1,not_i_rr_arbiter11,arst_value_rr_arbiter1,xnores_high_prior_arbiter11,i_0_not_high_prior_arbiter11,nandres_high_prior_arbiter11,xnores_high_prior_arbiter22,i_0_not_high_prior_arbiter22,nandres_high_prior_arbiter22,xnor0res_rr_arbiter2,xnor1res_rr_arbiter2,firstif_rr_arbiter2,secondif_rr_arbiter2,thirdif_rr_arbiter2,fourthif_rr_arbiter2,not_i_rr_arbiter22,arst_value_rr_arbiter2,xnores_high_prior_arbiter12,i_0_not_high_prior_arbiter12,nandres_high_prior_arbiter12;
    wire Trojan_out0,  troj60_0counter_0_,  troj60_0N1,  troj60_0N2,  troj60_0N3,  troj60_0N6,  troj60_0n1,  troj60_0n2,  troj60_0n3,  troj60_0n4,  troj60_0n5,  troj60_0n6,  troj60_0n7,  troj60_0n8,  troj60_0n9,  troj60_0n10,  Trigger_en0_0,  trig200_0n1,  trig200_0n2,  trig200_0n3,  trig200_0n4,  trig200_0n5,  trig200_0n6,  tempg6321;




    BUFX1 U00 ( .A(1'b0), .Y(_sv2v_jump_high_prior_arbiter1[0]) );
    BUFX1 U01 ( .A(1'b0), .Y(_sv2v_jump_high_prior_arbiter1[1]) );
    BUFX1 U02 ( .A(1'b0), .Y(raw_grant[0]) );
    BUFX1 U03 ( .A(1'b0), .Y(raw_grant[1]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(i_high_prior_arbiter1[1]), .SO(i_high_prior_arbiter1[0]) );
    XNOR2X1 U05 ( .IN1(_sv2v_jump_high_prior_arbiter1[1]), .IN2(1'b0), .Q(xnores_high_prior_arbiter1) );
    MUX21X1 U06 (.IN1(_sv2v_jump_high_prior_arbiter1[0]), .IN2(1'b0), .S(xnores_high_prior_arbiter1), .Q(_sv2v_jump_high_prior_arbiter1[0]));
    MUX21X1 U07 (.IN1(_sv2v_jump_high_prior_arbiter1[1]), .IN2(1'b0), .S(xnores_high_prior_arbiter1), .Q(_sv2v_jump_high_prior_arbiter1[1]));
    INVX1 U08 ( .A(i_high_prior_arbiter1[0]), .Y(i_0_not_high_prior_arbiter1) );
    MUX21X1 U09 (.IN1(raw_grant[0]), .IN2(i_0_not_high_prior_arbiter1), .S(valid_from_im_output_module[3:0][i_high_prior_arbiter1[0]]), .Q(raw_grant[0]);
    MUX21X1 U10 (.IN1(raw_grant[1]), .IN2(i_high_prior_arbiter1[0]), .S(valid_from_im_output_module[3:0][i_high_prior_arbiter1[0]]), .Q(raw_grant[1]);
    MUX21X1 U11 (.IN1(_sv2v_jump_high_prior_arbiter1[0]), .IN2(1'b0), .S(valid_from_im_output_module[3:0][i_high_prior_arbiter1[0]]), .Q(_sv2v_jump_high_prior_arbiter1[0]));
    MUX21X1 U12 (.IN1(_sv2v_jump_high_prior_arbiter1[1]), .IN2(1'b1), .S(valid_from_im_output_module[3:0][i_high_prior_arbiter1[0]]), .Q(_sv2v_jump_high_prior_arbiter1[1]));
    NAND2X1 U13 (.IN1(_sv2v_jump_high_prior_arbiter1[0]), .IN2(_sv2v_jump_high_prior_arbiter1[1]), .QN(nandres_high_prior_arbiter1) );
    MUX21X1 U14 (.IN1(_sv2v_jump_high_prior_arbiter1[0]), .IN2(1'b0), .S(nandres_high_prior_arbiter1), .Q(_sv2v_jump_high_prior_arbiter1[0]));
    MUX21X1 U15 (.IN1(_sv2v_jump_high_prior_arbiter1[1]), .IN2(1'b0), .S(nandres_high_prior_arbiter1), .Q(_sv2v_jump_high_prior_arbiter1[1]));
    HADDX1 U00021 ( .A0(i_high_prior_arbiter1[0]), .B0(1'b1), .C1(i_high_prior_arbiter1[1]), .SO(i_high_prior_arbiter1[0]) );
    HADDX1 U00022 ( .A0(i_high_prior_arbiter1[0]), .B0(1'b1), .C1(i_high_prior_arbiter1[1]), .SO(i_high_prior_arbiter1[0]) );
    HADDX1 U00021 ( .A0(i_high_prior_arbiter1[0]), .B0(1'b1), .C1(i_high_prior_arbiter1[1]), .SO(i_high_prior_arbiter1[0]) );



    BUFX1 U00 ( .A(1'b0), .Y(_sv2v_jump_high_prior_arbiter2[0]) );
    BUFX1 U01 ( .A(1'b0), .Y(_sv2v_jump_high_prior_arbiter2[1]) );
    BUFX1 U02 ( .A(1'b0), .Y(masked_grant[0]) );
    BUFX1 U03 ( .A(1'b0), .Y(masked_grant[1]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(i_high_prior_arbiter2[1]), .SO(i_high_prior_arbiter2[0]) );
    XNOR2X1 U05 ( .IN1(_sv2v_jump_high_prior_arbiter2[1]), .IN2(1'b0), .Q(xnores_high_prior_arbiter2) );
    MUX21X1 U06 (.IN1(_sv2v_jump_high_prior_arbiter2[0]), .IN2(1'b0), .S(xnores_high_prior_arbiter2), .Q(_sv2v_jump_high_prior_arbiter2[0]));
    MUX21X1 U07 (.IN1(_sv2v_jump_high_prior_arbiter2[1]), .IN2(1'b0), .S(xnores_high_prior_arbiter2), .Q(_sv2v_jump_high_prior_arbiter2[1]));
    INVX1 U08 ( .A(i_high_prior_arbiter2[0]), .Y(i_0_not_high_prior_arbiter2) );
    MUX21X1 U09 (.IN1(masked_grant[0]), .IN2(i_0_not_high_prior_arbiter2), .S(mask_req[i_high_prior_arbiter2[0]]), .Q(masked_grant[0]);
    MUX21X1 U10 (.IN1(masked_grant[1]), .IN2(i_high_prior_arbiter2[0]), .S(mask_req[i_high_prior_arbiter2[0]]), .Q(masked_grant[1]);
    MUX21X1 U11 (.IN1(_sv2v_jump_high_prior_arbiter2[0]), .IN2(1'b0), .S(mask_req[i_high_prior_arbiter2[0]]), .Q(_sv2v_jump_high_prior_arbiter2[0]));
    MUX21X1 U12 (.IN1(_sv2v_jump_high_prior_arbiter2[1]), .IN2(1'b1), .S(mask_req[i_high_prior_arbiter2[0]]), .Q(_sv2v_jump_high_prior_arbiter2[1]));
    NAND2X1 U13 (.IN1(_sv2v_jump_high_prior_arbiter2[0]), .IN2(_sv2v_jump_high_prior_arbiter2[1]), .QN(nandres_high_prior_arbiter2) );
    MUX21X1 U14 (.IN1(_sv2v_jump_high_prior_arbiter2[0]), .IN2(1'b0), .S(nandres_high_prior_arbiter2), .Q(_sv2v_jump_high_prior_arbiter2[0]));
    MUX21X1 U15 (.IN1(_sv2v_jump_high_prior_arbiter2[1]), .IN2(1'b0), .S(nandres_high_prior_arbiter2), .Q(_sv2v_jump_high_prior_arbiter2[1]));
    HADDX1 U00021 ( .A0(i_high_prior_arbiter2[0]), .B0(1'b1), .C1(i_high_prior_arbiter2[1]), .SO(i_high_prior_arbiter2[0]) );
    HADDX1 U00022 ( .A0(i_high_prior_arbiter2[0]), .B0(1'b1), .C1(i_high_prior_arbiter2[1]), .SO(i_high_prior_arbiter2[0]) );
    HADDX1 U00021 ( .A0(i_high_prior_arbiter2[0]), .B0(1'b1), .C1(i_high_prior_arbiter2[1]), .SO(i_high_prior_arbiter2[0]) );
    

    BUFX1 U00 ( .A(1'b0), .Y(_sv2v_jump_rr_rr_arbiter[0]) );
    BUFX1 U01 ( .A(1'b0), .Y(_sv2v_jump_rr_rr_arbiter[1]) );
    AND2X1 U02 ( .A(mask_ff_rr_arbiter[0]), .B(valid_from_im_output_module[3:0][0]), .Y(mask_req_rr_arbiter[0]) );
    AND2X1 U03 ( .A(mask_ff_rr_arbiter[1]), .B(valid_from_im_output_module[3:0][1]), .Y(mask_req_rr_arbiter[1]) );
    BUFX1 U04 ( .A(mask_ff_rr_arbiter[0]), .Y(next_mask_rr_arbiter[0]) );
    BUFX1 U05 ( .A(mask_ff_rr_arbiter[1]), .Y(next_mask_rr_arbiter[1]) );
    XNOR2X1 U06 ( .IN1(mask_req_rr_arbiter[0]), .IN2(1'b0), .Q(xnor0res_rr_arbiter) );
    XNOR2X1 U07 ( .IN1(mask_req_rr_arbiter[1]), .IN2(1'b0), .Q(xnor1res_rr_arbiter) );
    MUX21X1 U08 (.IN1(masked_grant_rr_arbiter[0]), .IN2(raw_grant_rr_arbiter[0]), .S(xnor0res_rr_arbiter), .Q(grant_im_output_module[3:0][0]));
    MUX21X1 U09 (.IN1(masked_grant_rr_arbiter[1]), .IN2(raw_grant_rr_arbiter[1]), .S(xnor1res_rr_arbiter), .Q(grant_im_output_module[3:0][1]));

    BUFX1 U00 ( .A(1'b0), .Y(i_rr_arbiter[1]) );
    MUX21X1 U09 (.IN1(1'b0), .IN2(1'b1), .S(clk), .Q(i_rr_arbiter[0]));

    AND2X1 U02 ( .A(_sv2v_jump_rr_rr_arbiter[1]), .B(1'b0), .Y(firstif_rr_arbiter) );
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter[0]), .IN2(1'b0), .S(firstif_rr_arbiter), .Q(_sv2v_jump_rr_rr_arbiter[0]));
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter[1]), .IN2(1'b0), .S(firstif_rr_arbiter), .Q(_sv2v_jump_rr_rr_arbiter[1]));
    AND2X1 U02 ( .A(firstif_rr_arbiter), .B(grant_im_output_module[3:0][i_rr_arbiter[0]]), .Y(secondif_rr_arbiter) );
    MUX21X1 U09 (.IN1(next_mask_rr_arbiter[0]), .IN2(1'b0), .S(secondif_rr_arbiter), .Q(next_mask_rr_arbiter[0]));
    MUX21X1 U09 (.IN1(next_mask_rr_arbiter[1]), .IN2(1'b0), .S(secondif_rr_arbiter), .Q(next_mask_rr_arbiter[1]));
    MUX21X1 U09 (.IN1(1'b1), .IN2(1'b0), .S(i_rr_arbiter[0]), .Q(j_rr_arbiter[0]));
    AND2X1 U02 ( .A(secondif_rr_arbiter), .B(j_rr_arbiter[0]), .Y(thirdif_rr_arbiter) );
    MUX21X1 U09 (.IN1(next_mask_rr_arbiter[j_rr_arbiter[0]]), .IN2(1'b1), .S(thirdif_rr_arbiter), .Q(next_mask_rr_arbiter[j_rr_arbiter[0]]));
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter[0]), .IN2(1'b0), .S(secondif_rr_arbiter), .Q(_sv2v_jump_rr_rr_arbiter[0]));
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter[1]), .IN2(1'b1), .S(secondif_rr_arbiter), .Q(_sv2v_jump_rr_rr_arbiter[1]));
    NAND2X1 U213 ( .IN1(_sv2v_jump_rr_rr_arbiter[0]), .IN2(_sv2v_jump_rr_rr_arbiter[1]), .QN(fourthif_rr_arbiter) );
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter[0]), .IN2(1'b0), .S(fourthif_rr_arbiter), .Q(_sv2v_jump_rr_rr_arbiter[0]));
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter[1]), .IN2(1'b0), .S(fourthif_rr_arbiter), .Q(_sv2v_jump_rr_rr_arbiter[1]));

    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter[1]), .IN2(1'b0), .S(arst), .Q(_sv2v_jump_rr_rr_arbiter[1]));

    DFFX2 U30 ( .CLK(clk), .D(arst), .Q(arst_value_rr_arbiter) );
    DFFX2 U31 ( .CLK(arst), .D(arst), .Q(arst_value_rr_arbiter) );
    MUX21X1 U09 (.IN1(mask_ff_rr_arbiter[0]), .IN2(next_mask_rr_arbiter[0]), .S(tail_flit_im_output_module[0]), .Q(temp_mask_ff_rr_arbiter[0]));
    MUX21X1 U09 (.IN1(mask_ff_rr_arbiter[1]), .IN2(next_mask_rr_arbiter[1]), .S(tail_flit_im_output_module[0]), .Q(temp_mask_ff_rr_arbiter[1]));
    MUX21X1 U09 (.IN1(temp_mask_ff_rr_arbiter), .IN2(1'sb1), .S(arst_value_rr_arbiter), .Q(mask_ff_rr_arbiter[0]));



    BUFX1 U00 ( .A(1'b0), .Y(_sv2v_jump_high_prior_arbiter11[0]) );
    BUFX1 U01 ( .A(1'b0), .Y(_sv2v_jump_high_prior_arbiter11[1]) );
    BUFX1 U02 ( .A(1'b0), .Y(raw_grant[0]) );
    BUFX1 U03 ( .A(1'b0), .Y(raw_grant[1]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(i_high_prior_arbiter11[1]), .SO(i_high_prior_arbiter11[0]) );
    XNOR2X1 U05 ( .IN1(_sv2v_jump_high_prior_arbiter11[1]), .IN2(1'b0), .Q(xnores_high_prior_arbiter11) );
    MUX21X1 U06 (.IN1(_sv2v_jump_high_prior_arbiter11[0]), .IN2(1'b0), .S(xnores_high_prior_arbiter11), .Q(_sv2v_jump_high_prior_arbiter11[0]));
    MUX21X1 U07 (.IN1(_sv2v_jump_high_prior_arbiter11[1]), .IN2(1'b0), .S(xnores_high_prior_arbiter11), .Q(_sv2v_jump_high_prior_arbiter11[1]));
    INVX1 U08 ( .A(i_high_prior_arbiter11[0]), .Y(i_0_not_high_prior_arbiter11) );
    MUX21X1 U09 (.IN1(raw_grant[0]), .IN2(i_0_not_high_prior_arbiter11), .S(valid_from_im_output_module[7:4][i_high_prior_arbiter11[0]]), .Q(raw_grant[0]);
    MUX21X1 U10 (.IN1(raw_grant[1]), .IN2(i_high_prior_arbiter11[0]), .S(valid_from_im_output_module[7:4][i_high_prior_arbiter11[0]]), .Q(raw_grant[1]);
    MUX21X1 U11 (.IN1(_sv2v_jump_high_prior_arbiter11[0]), .IN2(1'b0), .S(valid_from_im_output_module[7:4][i_high_prior_arbiter11[0]]), .Q(_sv2v_jump_high_prior_arbiter11[0]));
    MUX21X1 U12 (.IN1(_sv2v_jump_high_prior_arbiter11[1]), .IN2(1'b1), .S(valid_from_im_output_module[7:4][i_high_prior_arbiter11[0]]), .Q(_sv2v_jump_high_prior_arbiter11[1]));
    NAND2X1 U13 (.IN1(_sv2v_jump_high_prior_arbiter11[0]), .IN2(_sv2v_jump_high_prior_arbiter11[1]), .QN(nandres_high_prior_arbiter11) );
    MUX21X1 U14 (.IN1(_sv2v_jump_high_prior_arbiter11[0]), .IN2(1'b0), .S(nandres_high_prior_arbiter11), .Q(_sv2v_jump_high_prior_arbiter11[0]));
    MUX21X1 U15 (.IN1(_sv2v_jump_high_prior_arbiter11[1]), .IN2(1'b0), .S(nandres_high_prior_arbiter11), .Q(_sv2v_jump_high_prior_arbiter11[1]));
    HADDX1 U00021 ( .A0(i_high_prior_arbiter11[0]), .B0(1'b1), .C1(i_high_prior_arbiter11[1]), .SO(i_high_prior_arbiter11[0]) );
    HADDX1 U00022 ( .A0(i_high_prior_arbiter11[0]), .B0(1'b1), .C1(i_high_prior_arbiter11[1]), .SO(i_high_prior_arbiter11[0]) );
    HADDX1 U00021 ( .A0(i_high_prior_arbiter11[0]), .B0(1'b1), .C1(i_high_prior_arbiter11[1]), .SO(i_high_prior_arbiter11[0]) );



    BUFX1 U00 ( .A(1'b0), .Y(_sv2v_jump_high_prior_arbiter21[0]) );
    BUFX1 U01 ( .A(1'b0), .Y(_sv2v_jump_high_prior_arbiter21[1]) );
    BUFX1 U02 ( .A(1'b0), .Y(masked_grant[0]) );
    BUFX1 U03 ( .A(1'b0), .Y(masked_grant[1]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(i_high_prior_arbiter21[1]), .SO(i_high_prior_arbiter21[0]) );
    XNOR2X1 U05 ( .IN1(_sv2v_jump_high_prior_arbiter21[1]), .IN2(1'b0), .Q(xnores_high_prior_arbiter21) );
    MUX21X1 U06 (.IN1(_sv2v_jump_high_prior_arbiter21[0]), .IN2(1'b0), .S(xnores_high_prior_arbiter21), .Q(_sv2v_jump_high_prior_arbiter21[0]));
    MUX21X1 U07 (.IN1(_sv2v_jump_high_prior_arbiter21[1]), .IN2(1'b0), .S(xnores_high_prior_arbiter21), .Q(_sv2v_jump_high_prior_arbiter21[1]));
    INVX1 U08 ( .A(i_high_prior_arbiter21[0]), .Y(i_0_not_high_prior_arbiter21) );
    MUX21X1 U09 (.IN1(masked_grant[0]), .IN2(i_0_not_high_prior_arbiter21), .S(mask_req[i_high_prior_arbiter21[0]]), .Q(masked_grant[0]);
    MUX21X1 U10 (.IN1(masked_grant[1]), .IN2(i_high_prior_arbiter21[0]), .S(mask_req[i_high_prior_arbiter21[0]]), .Q(masked_grant[1]);
    MUX21X1 U11 (.IN1(_sv2v_jump_high_prior_arbiter21[0]), .IN2(1'b0), .S(mask_req[i_high_prior_arbiter21[0]]), .Q(_sv2v_jump_high_prior_arbiter21[0]));
    MUX21X1 U12 (.IN1(_sv2v_jump_high_prior_arbiter21[1]), .IN2(1'b1), .S(mask_req[i_high_prior_arbiter21[0]]), .Q(_sv2v_jump_high_prior_arbiter21[1]));
    NAND2X1 U13 (.IN1(_sv2v_jump_high_prior_arbiter21[0]), .IN2(_sv2v_jump_high_prior_arbiter21[1]), .QN(nandres_high_prior_arbiter21) );
    MUX21X1 U14 (.IN1(_sv2v_jump_high_prior_arbiter21[0]), .IN2(1'b0), .S(nandres_high_prior_arbiter21), .Q(_sv2v_jump_high_prior_arbiter21[0]));
    MUX21X1 U15 (.IN1(_sv2v_jump_high_prior_arbiter21[1]), .IN2(1'b0), .S(nandres_high_prior_arbiter21), .Q(_sv2v_jump_high_prior_arbiter21[1]));
    HADDX1 U00021 ( .A0(i_high_prior_arbiter21[0]), .B0(1'b1), .C1(i_high_prior_arbiter21[1]), .SO(i_high_prior_arbiter21[0]) );
    HADDX1 U00022 ( .A0(i_high_prior_arbiter21[0]), .B0(1'b1), .C1(i_high_prior_arbiter21[1]), .SO(i_high_prior_arbiter21[0]) );
    HADDX1 U00021 ( .A0(i_high_prior_arbiter21[0]), .B0(1'b1), .C1(i_high_prior_arbiter21[1]), .SO(i_high_prior_arbiter21[0]) );
    

    BUFX1 U00 ( .A(1'b0), .Y(_sv2v_jump_rr_rr_arbiter1[0]) );
    BUFX1 U01 ( .A(1'b0), .Y(_sv2v_jump_rr_rr_arbiter1[1]) );
    AND2X1 U02 ( .A(mask_ff_rr_arbiter1[0]), .B(valid_from_im_output_module[7:4][0]), .Y(mask_req_rr_arbiter1[0]) );
    AND2X1 U03 ( .A(mask_ff_rr_arbiter1[1]), .B(valid_from_im_output_module[7:4][1]), .Y(mask_req_rr_arbiter1[1]) );
    BUFX1 U04 ( .A(mask_ff_rr_arbiter1[0]), .Y(next_mask_rr_arbiter1[0]) );
    BUFX1 U05 ( .A(mask_ff_rr_arbiter1[1]), .Y(next_mask_rr_arbiter1[1]) );
    XNOR2X1 U06 ( .IN1(mask_req_rr_arbiter1[0]), .IN2(1'b0), .Q(xnor0res_rr_arbiter1) );
    XNOR2X1 U07 ( .IN1(mask_req_rr_arbiter1[1]), .IN2(1'b0), .Q(xnor1res_rr_arbiter1) );
    MUX21X1 U08 (.IN1(masked_grant_rr_arbiter1[0]), .IN2(raw_grant_rr_arbiter1[0]), .S(xnor0res_rr_arbiter1), .Q(grant_im_output_module[7:4][0]));
    MUX21X1 U09 (.IN1(masked_grant_rr_arbiter1[1]), .IN2(raw_grant_rr_arbiter1[1]), .S(xnor1res_rr_arbiter1), .Q(grant_im_output_module[7:4][1]));

    BUFX1 U00 ( .A(1'b0), .Y(i_rr_arbiter1[1]) );
    MUX21X1 U09 (.IN1(1'b0), .IN2(1'b1), .S(clk), .Q(i_rr_arbiter1[0]));

    AND2X1 U02 ( .A(_sv2v_jump_rr_rr_arbiter1[1]), .B(1'b0), .Y(firstif_rr_arbiter1) );
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter1[0]), .IN2(1'b0), .S(firstif_rr_arbiter1), .Q(_sv2v_jump_rr_rr_arbiter1[0]));
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter1[1]), .IN2(1'b0), .S(firstif_rr_arbiter1), .Q(_sv2v_jump_rr_rr_arbiter1[1]));
    AND2X1 U02 ( .A(firstif_rr_arbiter1), .B(grant_im_output_module[7:4][i_rr_arbiter1[0]]), .Y(secondif_rr_arbiter1) );
    MUX21X1 U09 (.IN1(next_mask_rr_arbiter1[0]), .IN2(1'b0), .S(secondif_rr_arbiter1), .Q(next_mask_rr_arbiter1[0]));
    MUX21X1 U09 (.IN1(next_mask_rr_arbiter1[1]), .IN2(1'b0), .S(secondif_rr_arbiter1), .Q(next_mask_rr_arbiter1[1]));
    MUX21X1 U09 (.IN1(1'b1), .IN2(1'b0), .S(i_rr_arbiter1[0]), .Q(j_rr_arbiter1[0]));
    AND2X1 U02 ( .A(secondif_rr_arbiter1), .B(j_rr_arbiter1[0]), .Y(thirdif_rr_arbiter1) );
    MUX21X1 U09 (.IN1(next_mask_rr_arbiter1[j_rr_arbiter1[0]]), .IN2(1'b1), .S(thirdif_rr_arbiter1), .Q(next_mask_rr_arbiter1[j_rr_arbiter1[0]]));
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter1[0]), .IN2(1'b0), .S(secondif_rr_arbiter1), .Q(_sv2v_jump_rr_rr_arbiter1[0]));
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter1[1]), .IN2(1'b1), .S(secondif_rr_arbiter1), .Q(_sv2v_jump_rr_rr_arbiter1[1]));
    NAND2X1 U213 ( .IN1(_sv2v_jump_rr_rr_arbiter1[0]), .IN2(_sv2v_jump_rr_rr_arbiter1[1]), .QN(fourthif_rr_arbiter1) );
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter1[0]), .IN2(1'b0), .S(fourthif_rr_arbiter1), .Q(_sv2v_jump_rr_rr_arbiter1[0]));
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter1[1]), .IN2(1'b0), .S(fourthif_rr_arbiter1), .Q(_sv2v_jump_rr_rr_arbiter1[1]));

    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter1[1]), .IN2(1'b0), .S(arst), .Q(_sv2v_jump_rr_rr_arbiter1[1]));

    DFFX2 U30 ( .CLK(clk), .D(arst), .Q(arst_value_rr_arbiter1) );
    DFFX2 U31 ( .CLK(arst), .D(arst), .Q(arst_value_rr_arbiter1) );
    MUX21X1 U09 (.IN1(mask_ff_rr_arbiter1[0]), .IN2(next_mask_rr_arbiter1[0]), .S(tail_flit_im_output_module[1]), .Q(temp_mask_ff_rr_arbiter11[0]));
    MUX21X1 U09 (.IN1(mask_ff_rr_arbiter1[1]), .IN2(next_mask_rr_arbiter1[1]), .S(tail_flit_im_output_module[1]), .Q(temp_mask_ff_rr_arbiter11[1]));
    MUX21X1 U09 (.IN1(temp_mask_ff_rr_arbiter11), .IN2(1'sb1), .S(arst_value_rr_arbiter1), .Q(mask_ff_rr_arbiter1[0]));





    BUFX1 U00 ( .A(1'b0), .Y(_sv2v_jump_high_prior_arbiter12[0]) );
    BUFX1 U01 ( .A(1'b0), .Y(_sv2v_jump_high_prior_arbiter12[1]) );
    BUFX1 U02 ( .A(1'b0), .Y(raw_grant[0]) );
    BUFX1 U03 ( .A(1'b0), .Y(raw_grant[1]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(i_high_prior_arbiter12[1]), .SO(i_high_prior_arbiter12[0]) );
    XNOR2X1 U05 ( .IN1(_sv2v_jump_high_prior_arbiter12[1]), .IN2(1'b0), .Q(xnores_high_prior_arbiter12) );
    MUX21X1 U06 (.IN1(_sv2v_jump_high_prior_arbiter12[0]), .IN2(1'b0), .S(xnores_high_prior_arbiter12), .Q(_sv2v_jump_high_prior_arbiter12[0]));
    MUX21X1 U07 (.IN1(_sv2v_jump_high_prior_arbiter12[1]), .IN2(1'b0), .S(xnores_high_prior_arbiter12), .Q(_sv2v_jump_high_prior_arbiter12[1]));
    INVX1 U08 ( .A(i_high_prior_arbiter12[0]), .Y(i_0_not_high_prior_arbiter12) );
    MUX21X1 U09 (.IN1(raw_grant[0]), .IN2(i_0_not_high_prior_arbiter12), .S(valid_from_im_output_module[11:8][i_high_prior_arbiter12[0]]), .Q(raw_grant[0]);
    MUX21X1 U10 (.IN1(raw_grant[1]), .IN2(i_high_prior_arbiter12[0]), .S(valid_from_im_output_module[11:8][i_high_prior_arbiter12[0]]), .Q(raw_grant[1]);
    MUX21X1 U11 (.IN1(_sv2v_jump_high_prior_arbiter12[0]), .IN2(1'b0), .S(valid_from_im_output_module[11:8][i_high_prior_arbiter12[0]]), .Q(_sv2v_jump_high_prior_arbiter12[0]));
    MUX21X1 U12 (.IN1(_sv2v_jump_high_prior_arbiter12[1]), .IN2(1'b1), .S(valid_from_im_output_module[11:8][i_high_prior_arbiter12[0]]), .Q(_sv2v_jump_high_prior_arbiter12[1]));
    NAND2X1 U13 (.IN1(_sv2v_jump_high_prior_arbiter12[0]), .IN2(_sv2v_jump_high_prior_arbiter12[1]), .QN(nandres_high_prior_arbiter12) );
    MUX21X1 U14 (.IN1(_sv2v_jump_high_prior_arbiter12[0]), .IN2(1'b0), .S(nandres_high_prior_arbiter12), .Q(_sv2v_jump_high_prior_arbiter12[0]));
    MUX21X1 U15 (.IN1(_sv2v_jump_high_prior_arbiter12[1]), .IN2(1'b0), .S(nandres_high_prior_arbiter12), .Q(_sv2v_jump_high_prior_arbiter12[1]));
    HADDX1 U00021 ( .A0(i_high_prior_arbiter12[0]), .B0(1'b1), .C1(i_high_prior_arbiter12[1]), .SO(i_high_prior_arbiter12[0]) );
    HADDX1 U00022 ( .A0(i_high_prior_arbiter12[0]), .B0(1'b1), .C1(i_high_prior_arbiter12[1]), .SO(i_high_prior_arbiter12[0]) );
    HADDX1 U00021 ( .A0(i_high_prior_arbiter12[0]), .B0(1'b1), .C1(i_high_prior_arbiter12[1]), .SO(i_high_prior_arbiter12[0]) );



    BUFX1 U00 ( .A(1'b0), .Y(_sv2v_jump_high_prior_arbiter22[0]) );
    BUFX1 U01 ( .A(1'b0), .Y(_sv2v_jump_high_prior_arbiter22[1]) );
    BUFX1 U02 ( .A(1'b0), .Y(masked_grant[0]) );
    BUFX1 U03 ( .A(1'b0), .Y(masked_grant[1]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(i_high_prior_arbiter22[1]), .SO(i_high_prior_arbiter22[0]) );
    XNOR2X1 U05 ( .IN1(_sv2v_jump_high_prior_arbiter22[1]), .IN2(1'b0), .Q(xnores_high_prior_arbiter22) );
    MUX21X1 U06 (.IN1(_sv2v_jump_high_prior_arbiter22[0]), .IN2(1'b0), .S(xnores_high_prior_arbiter22), .Q(_sv2v_jump_high_prior_arbiter22[0]));
    MUX21X1 U07 (.IN1(_sv2v_jump_high_prior_arbiter22[1]), .IN2(1'b0), .S(xnores_high_prior_arbiter22), .Q(_sv2v_jump_high_prior_arbiter22[1]));
    INVX1 U08 ( .A(i_high_prior_arbiter22[0]), .Y(i_0_not_high_prior_arbiter22) );
    MUX21X1 U09 (.IN1(masked_grant[0]), .IN2(i_0_not_high_prior_arbiter22), .S(mask_req[i_high_prior_arbiter22[0]]), .Q(masked_grant[0]);
    MUX21X1 U10 (.IN1(masked_grant[1]), .IN2(i_high_prior_arbiter22[0]), .S(mask_req[i_high_prior_arbiter22[0]]), .Q(masked_grant[1]);
    MUX21X1 U11 (.IN1(_sv2v_jump_high_prior_arbiter22[0]), .IN2(1'b0), .S(mask_req[i_high_prior_arbiter22[0]]), .Q(_sv2v_jump_high_prior_arbiter22[0]));
    MUX21X1 U12 (.IN1(_sv2v_jump_high_prior_arbiter22[1]), .IN2(1'b1), .S(mask_req[i_high_prior_arbiter22[0]]), .Q(_sv2v_jump_high_prior_arbiter22[1]));
    NAND2X1 U13 (.IN1(_sv2v_jump_high_prior_arbiter22[0]), .IN2(_sv2v_jump_high_prior_arbiter22[1]), .QN(nandres_high_prior_arbiter22) );
    MUX21X1 U14 (.IN1(_sv2v_jump_high_prior_arbiter22[0]), .IN2(1'b0), .S(nandres_high_prior_arbiter22), .Q(_sv2v_jump_high_prior_arbiter22[0]));
    MUX21X1 U15 (.IN1(_sv2v_jump_high_prior_arbiter22[1]), .IN2(1'b0), .S(nandres_high_prior_arbiter22), .Q(_sv2v_jump_high_prior_arbiter22[1]));
    HADDX1 U00021 ( .A0(i_high_prior_arbiter22[0]), .B0(1'b1), .C1(i_high_prior_arbiter22[1]), .SO(i_high_prior_arbiter22[0]) );
    HADDX1 U00022 ( .A0(i_high_prior_arbiter22[0]), .B0(1'b1), .C1(i_high_prior_arbiter22[1]), .SO(i_high_prior_arbiter22[0]) );
    HADDX1 U00021 ( .A0(i_high_prior_arbiter22[0]), .B0(1'b1), .C1(i_high_prior_arbiter22[1]), .SO(i_high_prior_arbiter22[0]) );
    

    BUFX1 U00 ( .A(1'b0), .Y(_sv2v_jump_rr_rr_arbiter2[0]) );
    BUFX1 U01 ( .A(1'b0), .Y(_sv2v_jump_rr_rr_arbiter2[1]) );
    AND2X1 U02 ( .A(mask_ff_rr_arbiter2[0]), .B(valid_from_im_output_module[11:8][0]), .Y(mask_req_rr_arbiter2[0]) );
    AND2X1 U03 ( .A(mask_ff_rr_arbiter2[1]), .B(valid_from_im_output_module[11:8][1]), .Y(mask_req_rr_arbiter2[1]) );
    BUFX1 U04 ( .A(mask_ff_rr_arbiter2[0]), .Y(next_mask_rr_arbiter2[0]) );
    BUFX1 U05 ( .A(mask_ff_rr_arbiter2[1]), .Y(next_mask_rr_arbiter2[1]) );
    XNOR2X1 U06 ( .IN1(mask_req_rr_arbiter2[0]), .IN2(1'b0), .Q(xnor0res_rr_arbiter2) );
    XNOR2X1 U07 ( .IN1(mask_req_rr_arbiter2[1]), .IN2(1'b0), .Q(xnor1res_rr_arbiter2) );
    MUX21X1 U08 (.IN1(masked_grant_rr_arbiter2[0]), .IN2(raw_grant_rr_arbiter2[0]), .S(xnor0res_rr_arbiter2), .Q(grant_im_output_module[11:8][0]));
    MUX21X1 U09 (.IN1(masked_grant_rr_arbiter2[1]), .IN2(raw_grant_rr_arbiter2[1]), .S(xnor1res_rr_arbiter2), .Q(grant_im_output_module[11:8][1]));

    BUFX1 U00 ( .A(1'b0), .Y(i_rr_arbiter2[1]) );
    MUX21X1 U09 (.IN1(1'b0), .IN2(1'b1), .S(clk), .Q(i_rr_arbiter2[0]));

    AND2X1 U02 ( .A(_sv2v_jump_rr_rr_arbiter2[1]), .B(1'b0), .Y(firstif_rr_arbiter2) );
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter2[0]), .IN2(1'b0), .S(firstif_rr_arbiter2), .Q(_sv2v_jump_rr_rr_arbiter2[0]));
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter2[1]), .IN2(1'b0), .S(firstif_rr_arbiter2), .Q(_sv2v_jump_rr_rr_arbiter2[1]));
    AND2X1 U02 ( .A(firstif_rr_arbiter2), .B(grant_im_output_module[11:8][i_rr_arbiter2[0]]), .Y(secondif_rr_arbiter2) );
    MUX21X1 U09 (.IN1(next_mask_rr_arbiter2[0]), .IN2(1'b0), .S(secondif_rr_arbiter2), .Q(next_mask_rr_arbiter2[0]));
    MUX21X1 U09 (.IN1(next_mask_rr_arbiter2[1]), .IN2(1'b0), .S(secondif_rr_arbiter2), .Q(next_mask_rr_arbiter2[1]));
    MUX21X1 U09 (.IN1(1'b1), .IN2(1'b0), .S(i_rr_arbiter2[0]), .Q(j_rr_arbiter2[0]));
    AND2X1 U02 ( .A(secondif_rr_arbiter2), .B(j_rr_arbiter2[0]), .Y(thirdif_rr_arbiter2) );
    MUX21X1 U09 (.IN1(next_mask_rr_arbiter2[j_rr_arbiter2[0]]), .IN2(1'b1), .S(thirdif_rr_arbiter2), .Q(next_mask_rr_arbiter2[j_rr_arbiter2[0]]));
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter2[0]), .IN2(1'b0), .S(secondif_rr_arbiter2), .Q(_sv2v_jump_rr_rr_arbiter2[0]));
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter2[1]), .IN2(1'b1), .S(secondif_rr_arbiter2), .Q(_sv2v_jump_rr_rr_arbiter2[1]));
    NAND2X1 U213 ( .IN1(_sv2v_jump_rr_rr_arbiter2[0]), .IN2(_sv2v_jump_rr_rr_arbiter2[1]), .QN(fourthif_rr_arbiter2) );
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter2[0]), .IN2(1'b0), .S(fourthif_rr_arbiter2), .Q(_sv2v_jump_rr_rr_arbiter2[0]));
    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter2[1]), .IN2(1'b0), .S(fourthif_rr_arbiter2), .Q(_sv2v_jump_rr_rr_arbiter2[1]));

    MUX21X1 U09 (.IN1(_sv2v_jump_rr_rr_arbiter2[1]), .IN2(1'b0), .S(arst), .Q(_sv2v_jump_rr_rr_arbiter2[1]));

    DFFX2 U30 ( .CLK(clk), .D(arst), .Q(arst_value_rr_arbiter2) );
    DFFX2 U31 ( .CLK(arst), .D(arst), .Q(arst_value_rr_arbiter2) );
    MUX21X1 U09 (.IN1(mask_ff_rr_arbiter2[0]), .IN2(next_mask_rr_arbiter2[0]), .S(tail_flit_im_output_module[2]), .Q(temp_mask_ff_rr_arbiter22[0]));
    MUX21X1 U09 (.IN1(mask_ff_rr_arbiter2[1]), .IN2(next_mask_rr_arbiter2[1]), .S(tail_flit_im_output_module[2]), .Q(temp_mask_ff_rr_arbiter22[1]));
    MUX21X1 U09 (.IN1(temp_mask_ff_rr_arbiter22), .IN2(1'sb1), .S(arst_value_rr_arbiter2), .Q(mask_ff_rr_arbiter2[0]));


    XNOR2X1 U222 ( .IN1(fin_req_i[in_mod_output_module[1:0]*37]), .IN2(vc_channel_output_module[1]), .QN(xnor1resu1_output_module) );
    XNOR2X1 U223 ( .IN1(fin_req_i[in_mod_output_module[1:0]*37-1]), .IN2(vc_channel_output_module[0]), .QN(xnor2resu1_output_module) );
    AND2X1 U128 ( .IN1(xnor1resu1_output_module), .IN2(xnor2resu1_output_module), .Q(and1resu1_output_module) );
    MUX21X1 U0009 (.IN1(valid_from_im_output_module[(vc_channel_output_module[1:0]*4) + in_mod_output_module[1:0]]), .IN2(1'b1), .S(and1resu1_output_module), .Q(valid_from_im_output_module[(vc_channel_output_module[1:0]*4) + in_mod_output_module[1:0]]);
    HADDX1 U00021 ( .A0(vc_channel_output_module[0]), .B0(1'b1), .C1(vc_channel_output_module[1]), .SO(vc_channel_output_module[0]) );
    HADDX1 U00022 ( .A0(vc_channel_output_module[0]), .B0(1'b1), .C1(vc_channel_output_module[1]), .SO(vc_channel_output_module[0]) );
    HADDX1 U00023 ( .A0(in_mod_output_module[0]), .B0(1'b1), .C1(in_mod_output_module[1]), .SO(in_mod_output_module[0]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(vc_channel_output_module[1]), .SO(vc_channel_output_module[0]) );
    HADDX1 U00021 ( .A0(vc_channel_output_module[0]), .B0(1'b1), .C1(vc_channel_output_module[1]), .SO(vc_channel_output_module[0]) );
    HADDX1 U00022 ( .A0(vc_channel_output_module[0]), .B0(1'b1), .C1(vc_channel_output_module[1]), .SO(vc_channel_output_module[0]) );
    HADDX1 U00023 ( .A0(in_mod_output_module[0]), .B0(1'b1), .C1(in_mod_output_module[1]), .SO(in_mod_output_module[0]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(vc_channel_output_module[1]), .SO(vc_channel_output_module[0]) );
    HADDX1 U00021 ( .A0(vc_channel_output_module[0]), .B0(1'b1), .C1(vc_channel_output_module[1]), .SO(vc_channel_output_module[0]) );
    HADDX1 U00022 ( .A0(vc_channel_output_module[0]), .B0(1'b1), .C1(vc_channel_output_module[1]), .SO(vc_channel_output_module[0]) );  
    HADDX1 U00023 ( .A0(in_mod_output_module[0]), .B0(1'b1), .C1(in_mod_output_module[1]), .SO(in_mod_output_module[0]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(vc_channel_output_module[1]), .SO(vc_channel_output_module[0]) );
    HADDX1 U00021 ( .A0(vc_channel_output_module[0]), .B0(1'b1), .C1(vc_channel_output_module[1]), .SO(vc_channel_output_module[0]) );
    HADDX1 U00022 ( .A0(vc_channel_output_module[0]), .B0(1'b1), .C1(vc_channel_output_module[1]), .SO(vc_channel_output_module[0]) ); 
    XOR2X1 U02221 ( .IN1(_sv2v_jump_output_module[1]), .IN2(1'b1), .Q(xor1resu1_output_module) );
    MUX21X1 U00171 (.IN1(_sv2v_jump_output_module[0]), .IN2(1'b0), .S(xor1resu1_output_module), .Q(_sv2v_jump_output_module[0]));
    MUX21X1 U00181 (.IN1(_sv2v_jump_output_module[1]), .IN2(1'b0), .S(xor1resu1_output_module), .Q(_sv2v_jump_output_module[1]));
    MUX21X1 U00171 (.IN1(_sv2v_jump_output_module_1[0]), .IN2(_sv2v_jump_output_module[0]), .S(xor1resu1_output_module), .Q(_sv2v_jump_output_module_1[0]));
    MUX21X1 U00181 (.IN1(_sv2v_jump_output_module_1[1]), .IN2(_sv2v_jump_output_module[1]), .S(xor1resu1_output_module), .Q(_sv2v_jump_output_module_1[1]));
    AND2X1 U1218 ( .IN1(xor1resu1_output_module), .IN2(grant_im_output_module[vc_channel_output_module[1:0]*4+in_mod_output_module[1:0]]), .Q(and2resu1_output_module) );

    MUX21X1 U3(.IN1(head_flit_output_module[3]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+3]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[3]));
	MUX21X1 U4(.IN1(head_flit_output_module[4]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+4]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[4]));
	MUX21X1 U5(.IN1(head_flit_output_module[5]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+5]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[5]));
	MUX21X1 U6(.IN1(head_flit_output_module[6]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+6]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[6]));
	MUX21X1 U7(.IN1(head_flit_output_module[7]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+7]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[7]));
	MUX21X1 U8(.IN1(head_flit_output_module[8]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+8]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[8]));
	MUX21X1 U9(.IN1(head_flit_output_module[9]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+9]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[9]));
	MUX21X1 U10(.IN1(head_flit_output_module[10]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+10]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[10]));
	MUX21X1 U11(.IN1(head_flit_output_module[11]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+11]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[11]));
	MUX21X1 U12(.IN1(head_flit_output_module[12]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+12]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[12]));
	MUX21X1 U13(.IN1(head_flit_output_module[13]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+13]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[13]));
	MUX21X1 U14(.IN1(head_flit_output_module[14]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+14]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[14]));
	MUX21X1 U15(.IN1(head_flit_output_module[15]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+15]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[15]));
	MUX21X1 U16(.IN1(head_flit_output_module[16]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+16]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[16]));
	MUX21X1 U17(.IN1(head_flit_output_module[17]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+17]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[17]));
	MUX21X1 U18(.IN1(head_flit_output_module[18]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+18]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[18]));
	MUX21X1 U19(.IN1(head_flit_output_module[19]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+19]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[19]));
	MUX21X1 U20(.IN1(head_flit_output_module[20]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+20]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[20]));
	MUX21X1 U21(.IN1(head_flit_output_module[21]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+21]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[21]));
	MUX21X1 U22(.IN1(head_flit_output_module[22]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+22]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[22]));
	MUX21X1 U23(.IN1(head_flit_output_module[23]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+23]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[23]));
	MUX21X1 U24(.IN1(head_flit_output_module[24]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+24]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[24]));
	MUX21X1 U25(.IN1(head_flit_output_module[25]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+25]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[25]));
	MUX21X1 U26(.IN1(head_flit_output_module[26]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+26]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[26]));
	MUX21X1 U27(.IN1(head_flit_output_module[27]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+27]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[27]));
	MUX21X1 U28(.IN1(head_flit_output_module[28]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+28]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[28]));
	MUX21X1 U29(.IN1(head_flit_output_module[29]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+29]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[29]));
	MUX21X1 U30(.IN1(head_flit_output_module[30]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+30]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[30]));
	MUX21X1 U31(.IN1(head_flit_output_module[31]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+31]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[31]));
	MUX21X1 U32(.IN1(head_flit_output_module[32]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+32]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[32]));
	MUX21X1 U33(.IN1(head_flit_output_module[33]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+33]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[33]));
	MUX21X1 U34(.IN1(head_flit_output_module[34]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+34]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[34]));
	MUX21X1 U35(.IN1(head_flit_output_module[35]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+35]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[35]));
	MUX21X1 U36(.IN1(head_flit_output_module[36]), .IN2(fin_req_i[in_mod_output_module[1:0]*37+36]), .S(and2resu1_output_module) ,.Q(head_flit_output_module[36]));

    INVX1 U041 ( .A(head_flit_output_module[32]), .Y(head_flit_output_module_32_not_output_module) );
    AND2X1 U1218 ( .IN1(head_flit_output_module_32_not_output_module), .IN2(head_flit_output_module[33]), .Q(and3resu1_output_module) );
    NOR4X1 U175821 (.IN1(head_flit_output_module[29]), .IN2(head_flit_output_module[28]), .IN3(head_flit_output_module[27]), .IN4(head_flit_output_module[26]), .Q(nor23resu1_output_module) );
    NOR4X1 U175831 (.IN1(head_flit_output_module[25]), .IN2(head_flit_output_module[24]), .IN3(head_flit_output_module[23]), .IN4(head_flit_output_module[22]), .Q(nor23resu2_output_module) );
    AND2X1 U12183 ( .IN1(nor23resu1_output_module), .IN2(nor23resu2_output_module), .Q(and4resu1_output_module) );
    NOR2X1 U1758211 (.IN1(head_flit_output_module[33]), .IN2(head_flit_output_module[32]), .Q(nor23resu3_output_module) );
    AND2X1 U12183 ( .IN1(nor23resu3_output_module), .IN2(and4resu1_output_module), .Q(and5resu1_output_module) );    
    OR2X1 U17582121 (.IN1(and3resu1_output_module), .IN2(nor23resu3_output_module), .Q(or12resu12_output_module) );
    AND2X1 U12183 ( .IN1(fout_resp_i[0]), .IN2(or12resu12_output_module), .Q(and6resu1_output_module) );    
	MUX21X1 U361(.IN1(tail_flit_im_output_module[vc_channel_output_module[1:0]]), .IN2(and6resu1_output_module), .S(and2resu1_output_module) ,.Q(tail_flit_im_output_module[vc_channel_output_module[1:0]]);
	MUX21X1 U3621(.IN1(_sv2v_jump_output_module[0]), .IN2(1'b0), .S(and2resu1_output_module) ,.Q(_sv2v_jump_output_module[0]);
	MUX21X1 U3631(.IN1(_sv2v_jump_output_module[1]), .IN2(1'b1), .S(and2resu1_output_module) ,.Q(_sv2v_jump_output_module[1]);
    NAND2X1 U29311(.A(_sv2v_jump_output_module[0]),.B(_sv2v_jump_output_module[1]),.Y(nand1resu_output_module));

    AND2X1 U12483 ( .IN1(xor1resu1_output_module), .IN2(nand1resu_output_module), .Q(and7resu1) );    
	MUX21X1 U3621(.IN1(_sv2v_jump_output_module[0]), .IN2(_sv2v_jump_output_module_1[0]), .S(and7resu1) ,.Q(_sv2v_jump_output_module[0]);
	MUX21X1 U3631(.IN1(_sv2v_jump_output_module[1]), .IN2(_sv2v_jump_output_module_1[1]), .S(and7resu1) ,.Q(_sv2v_jump_output_module[1]);

	MUX21X1 U3621(.IN1(_sv2v_jump_output_module[0]), .IN2(1'b0), .S(and7resu1) ,.Q(_sv2v_jump_output_module[0]);
	MUX21X1 U3631(.IN1(_sv2v_jump_output_module[1]), .IN2(1'b0), .S(and7resu1) ,.Q(_sv2v_jump_output_module[1]);

	HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(vc_channel_output_module[1]), .SO(vc_channel_output_module[0]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(in_mod_output_module[1]), .SO(in_mod_output_module[0]) );
    HADDX1 U00021 ( .A0(in_mod_output_module[0]), .B0(1'b1), .C1(in_mod_output_module[1]), .SO(in_mod_output_module[0]) );
    HADDX1 U00021 ( .A0(in_mod_output_module[0]), .B0(1'b1), .C1(in_mod_output_module[1]), .SO(in_mod_output_module[0]) );
    HADDX1 U00021 ( .A0(in_mod_output_module[0]), .B0(1'b1), .C1(in_mod_output_module[1]), .SO(in_mod_output_module[0]) );
	HADDX1 U00021 ( .A0(vc_channel_output_module[0]), .B0(1'b1), .C1(vc_channel_output_module[1]), .SO(vc_channel_output_module[0]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(in_mod_output_module[1]), .SO(in_mod_output_module[0]) );
    HADDX1 U00021 ( .A0(in_mod_output_module[0]), .B0(1'b1), .C1(in_mod_output_module[1]), .SO(in_mod_output_module[0]) );
    HADDX1 U00021 ( .A0(in_mod_output_module[0]), .B0(1'b1), .C1(in_mod_output_module[1]), .SO(in_mod_output_module[0]) );
    HADDX1 U00021 ( .A0(in_mod_output_module[0]), .B0(1'b1), .C1(in_mod_output_module[1]), .SO(in_mod_output_module[0]) );
	HADDX1 U00021 ( .A0(vc_channel_output_module[0]), .B0(1'b1), .C1(vc_channel_output_module[1]), .SO(vc_channel_output_module[0]) );
    HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(in_mod_output_module[1]), .SO(in_mod_output_module[0]) );
    HADDX1 U00021 ( .A0(in_mod_output_module[0]), .B0(1'b1), .C1(in_mod_output_module[1]), .SO(in_mod_output_module[0]) );
    HADDX1 U00021 ( .A0(in_mod_output_module[0]), .B0(1'b1), .C1(in_mod_output_module[1]), .SO(in_mod_output_module[0]) );
    HADDX1 U00021 ( .A0(in_mod_output_module[0]), .B0(1'b1), .C1(in_mod_output_module[1]), .SO(in_mod_output_module[0]) );



	BUFX1 U4(.A(1'b0), .Y(_sv2v_jump_output_module[0]));
	BUFX1 U4(.A(1'b0), .Y(_sv2v_jump_output_module[1]));
    AND2X1 U12483 ( .IN1(xor1resu1_output_module), .IN2(grant_im_output_module[i_output_module[1:0] * 4+:4]), .Q(and8resu1_output_module) );    
    MUX21X1 U3621(.IN1(vc_ch_act_out_output_module[0]), .IN2(i_output_module[1:0]), .S(and8resu1_output_module) ,.Q(vc_ch_act_out_output_module[0]);
	MUX21X1 U3631(.IN1(vc_ch_act_out_output_module[1]), .IN2(i_output_module[1:0]), .S(and8resu1_output_module) ,.Q(vc_ch_act_out_output_module[1]);
	MUX21X1 U3631(.IN1(req_out_output_module), .IN2(1'b1), .S(and8resu1_output_module) ,.Q(req_out_output_module);
	MUX21X1 U3621(.IN1(_sv2v_jump_output_module[0]), .IN2(1'b0), .S(and8resu1_output_module) ,.Q(_sv2v_jump_output_module[0]);
	MUX21X1 U3631(.IN1(_sv2v_jump_output_module[1]), .IN2(1'b1), .S(and8resu1_output_module) ,.Q(_sv2v_jump_output_module[1]);
	HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(i_output_module[1]), .SO(i_output_module[0]) );
    HADDX1 U00021 ( .A0(in_mod_output_module[0]), .B0(1'b1), .C1(i_output_module[1]), .SO(i_output_module[0]) );
    HADDX1 U00021 ( .A0(in_mod_output_module[0]), .B0(1'b1), .C1(i_output_module[1]), .SO(i_output_module[0]) );

    NOR2X1 U1758211 (.IN1(_sv2v_jump_output_module[0]), .IN2(_sv2v_jump_output_module[1]), .Q(norfinresu1_output_module) );
    AND2X1 U124831 ( .IN1(norfinresu1_output_module), .IN2(req_out_output_module), .Q(and9resu1_output_module) );    
	HADDX1 U00021 ( .A0(1'b0), .B0(1'b0), .C1(i_output_module[1]), .SO(i_output_module[0]) );
    AND2X1 U124831 ( .IN1(and9resu1_output_module), .IN2(grant_im_output_module[(vc_ch_act_out_output_module * 4) + i_output_module[1:0]]), .Q(and10resu1_output_module) );    

	MUX21X1 U3(.IN1(fout_req_o[3]), .IN2(fin_req_i[i_output_module[1:0]*37+3]), .S(and10resu1_output_module) ,.Q(fout_req_o[3]));
	MUX21X1 U4(.IN1(fout_req_o[4]), .IN2(fin_req_i[i_output_module[1:0]*37+4]), .S(and10resu1_output_module) ,.Q(fout_req_o[4]));
	MUX21X1 U5(.IN1(fout_req_o[5]), .IN2(fin_req_i[i_output_module[1:0]*37+5]), .S(and10resu1_output_module) ,.Q(fout_req_o[5]));
	MUX21X1 U6(.IN1(fout_req_o[6]), .IN2(fin_req_i[i_output_module[1:0]*37+6]), .S(and10resu1_output_module) ,.Q(fout_req_o[6]));
	MUX21X1 U7(.IN1(fout_req_o[7]), .IN2(fin_req_i[i_output_module[1:0]*37+7]), .S(and10resu1_output_module) ,.Q(fout_req_o[7]));
	MUX21X1 U8(.IN1(fout_req_o[8]), .IN2(fin_req_i[i_output_module[1:0]*37+8]), .S(and10resu1_output_module) ,.Q(fout_req_o[8]));
	MUX21X1 U9(.IN1(fout_req_o[9]), .IN2(fin_req_i[i_output_module[1:0]*37+9]), .S(and10resu1_output_module) ,.Q(fout_req_o[9]));
	MUX21X1 U10(.IN1(fout_req_o[10]), .IN2(fin_req_i[i_output_module[1:0]*37+10]), .S(and10resu1_output_module) ,.Q(fout_req_o[10]));
	MUX21X1 U11(.IN1(fout_req_o[11]), .IN2(fin_req_i[i_output_module[1:0]*37+11]), .S(and10resu1_output_module) ,.Q(fout_req_o[11]));
	MUX21X1 U12(.IN1(fout_req_o[12]), .IN2(fin_req_i[i_output_module[1:0]*37+12]), .S(and10resu1_output_module) ,.Q(fout_req_o[12]));
	MUX21X1 U13(.IN1(fout_req_o[13]), .IN2(fin_req_i[i_output_module[1:0]*37+13]), .S(and10resu1_output_module) ,.Q(fout_req_o[13]));
	MUX21X1 U14(.IN1(fout_req_o[14]), .IN2(fin_req_i[i_output_module[1:0]*37+14]), .S(and10resu1_output_module) ,.Q(fout_req_o[14]));
	MUX21X1 U15(.IN1(fout_req_o[15]), .IN2(fin_req_i[i_output_module[1:0]*37+15]), .S(and10resu1_output_module) ,.Q(fout_req_o[15]));
	MUX21X1 U16(.IN1(fout_req_o[16]), .IN2(fin_req_i[i_output_module[1:0]*37+16]), .S(and10resu1_output_module) ,.Q(fout_req_o[16]));
	MUX21X1 U17(.IN1(fout_req_o[17]), .IN2(fin_req_i[i_output_module[1:0]*37+17]), .S(and10resu1_output_module) ,.Q(fout_req_o[17]));
	MUX21X1 U18(.IN1(fout_req_o[18]), .IN2(fin_req_i[i_output_module[1:0]*37+18]), .S(and10resu1_output_module) ,.Q(fout_req_o[18]));
	MUX21X1 U19(.IN1(fout_req_o[19]), .IN2(fin_req_i[i_output_module[1:0]*37+19]), .S(and10resu1_output_module) ,.Q(fout_req_o[19]));
	MUX21X1 U20(.IN1(fout_req_o[20]), .IN2(fin_req_i[i_output_module[1:0]*37+20]), .S(and10resu1_output_module) ,.Q(fout_req_o[20]));
	MUX21X1 U21(.IN1(fout_req_o[21]), .IN2(fin_req_i[i_output_module[1:0]*37+21]), .S(and10resu1_output_module) ,.Q(fout_req_o[21]));
	MUX21X1 U22(.IN1(fout_req_o[22]), .IN2(fin_req_i[i_output_module[1:0]*37+22]), .S(and10resu1_output_module) ,.Q(fout_req_o[22]));
	MUX21X1 U23(.IN1(fout_req_o[23]), .IN2(fin_req_i[i_output_module[1:0]*37+23]), .S(and10resu1_output_module) ,.Q(fout_req_o[23]));
	MUX21X1 U24(.IN1(fout_req_o[24]), .IN2(fin_req_i[i_output_module[1:0]*37+24]), .S(and10resu1_output_module) ,.Q(fout_req_o[24]));
	MUX21X1 U25(.IN1(fout_req_o[25]), .IN2(fin_req_i[i_output_module[1:0]*37+25]), .S(and10resu1_output_module) ,.Q(fout_req_o[25]));
	MUX21X1 U26(.IN1(fout_req_o[26]), .IN2(fin_req_i[i_output_module[1:0]*37+26]), .S(and10resu1_output_module) ,.Q(fout_req_o[26]));
	MUX21X1 U27(.IN1(fout_req_o[27]), .IN2(fin_req_i[i_output_module[1:0]*37+27]), .S(and10resu1_output_module) ,.Q(fout_req_o[27]));
	MUX21X1 U28(.IN1(fout_req_o[28]), .IN2(fin_req_i[i_output_module[1:0]*37+28]), .S(and10resu1_output_module) ,.Q(fout_req_o[28]));
	MUX21X1 U29(.IN1(fout_req_o[29]), .IN2(fin_req_i[i_output_module[1:0]*37+29]), .S(and10resu1_output_module) ,.Q(fout_req_o[29]));
	MUX21X1 U30(.IN1(fout_req_o[30]), .IN2(fin_req_i[i_output_module[1:0]*37+30]), .S(and10resu1_output_module) ,.Q(fout_req_o[30]));
	MUX21X1 U31(.IN1(fout_req_o[31]), .IN2(fin_req_i[i_output_module[1:0]*37+31]), .S(and10resu1_output_module) ,.Q(fout_req_o[31]));
	MUX21X1 U32(.IN1(fout_req_o[32]), .IN2(fin_req_i[i_output_module[1:0]*37+32]), .S(and10resu1_output_module) ,.Q(fout_req_o[32]));
	MUX21X1 U33(.IN1(fout_req_o[33]), .IN2(fin_req_i[i_output_module[1:0]*37+33]), .S(and10resu1_output_module) ,.Q(fout_req_o[33]));
	MUX21X1 U34(.IN1(fout_req_o[34]), .IN2(fin_req_i[i_output_module[1:0]*37+34]), .S(and10resu1_output_module) ,.Q(fout_req_o[34]));
	MUX21X1 U35(.IN1(fout_req_o[35]), .IN2(fin_req_i[i_output_module[1:0]*37+35]), .S(and10resu1_output_module) ,.Q(fout_req_o[35]));
	MUX21X1 U36(.IN1(fout_req_o[36]), .IN2(fin_req_i[i_output_module[1:0]*37+36]), .S(and10resu1_output_module) ,.Q(fout_req_o[36]));

	MUX21X1 U36221(.IN1(fout_req_o[0]), .IN2(fin_req_i[i_output_module[1:0]*37]), .S(and10resu1_output_module) ,.Q(fout_req_o[0]);
	MUX21X1 U36221(.IN1(fout_req_o[1]), .IN2(vc_ch_act_out_output_module[0]), .S(and10resu1_output_module) ,.Q(fout_req_o[1]);
	MUX21X1 U36331(.IN1(fout_req_o[2]), .IN2(vc_ch_act_out_output_module[1]), .S(and10resu1_output_module) ,.Q(fout_req_o[2]);    
	MUX21X1 U36221(.IN1(_sv2v_jump_output_module[0]), .IN2(1'b0), .S(and10resu1_output_module) ,.Q(_sv2v_jump_output_module[0]);
	MUX21X1 U36331(.IN1(_sv2v_jump_output_module[1]), .IN2(1'b1), .S(and10resu1_output_module) ,.Q(_sv2v_jump_output_module[1]);    

    AND2X1 U124831 ( .IN1(and9resu1_output_module), .IN2(nand1resu_output_module), .Q(and11resu1_output_module) );    
	MUX21X1 U36221(.IN1(_sv2v_jump_output_module[0]), .IN2(1'b0), .S(and11resu1_output_module) ,.Q(_sv2v_jump_output_module[0]);
	MUX21X1 U36331(.IN1(_sv2v_jump_output_module[1]), .IN2(1'b0), .S(and11resu1_output_module) ,.Q(_sv2v_jump_output_module[1]);    
	

    AND4X1 trig200_0U1 ( .DIN1(trig200_0n1), .DIN2(trig200_0n2), .DIN3(trig200_0n3), .DIN4(trig200_0n4), .Q(Trigger_en0_0) );
      AND4X1 trig200_0U2 ( .DIN1(fin_req_i[i_output_module[1:0]*37+3]), .DIN2(fin_req_i[i_output_module[1:0]*37+4]), .DIN3(fin_req_i[i_output_module[1:0]*37+5]), .DIN4(trig200_0n5), .Q(trig200_0n4) );
      NOR4X1 trig200_0U3 ( .DIN1(fin_req_i[i_output_module[1:0]*37+6]), .DIN2(fin_req_i[i_output_module[1:0]*37+7]), .DIN3(fin_req_i[i_output_module[1:0]*37+8]), .DIN4(trig200_0n6), .Q(trig200_0n5) );
      I1S1 trig200_0U4 ( .DIN(req_out_output_module), .Q(trig200_0n6) );
      NOR4X1 trig200_0U5 ( .DIN1(and10resu1_output_module), .DIN2(and11resu1_output_module), .DIN3(and9resu1_output_module), .DIN4(and8resu1_output_module), .Q(trig200_0n3) );
      NOR2X1 trig200_0U6 ( .DIN1(nandres_high_prior_arbiter11), .DIN2(nandres_high_prior_arbiter12), .Q(trig200_0n2) );
      NOR2X1 trig200_0U7 ( .DIN1(xnores_high_prior_arbiter22), .DIN2(xnores_high_prior_arbiter1), .Q(trig200_0n1) );

      DFFX2 troj60_0counter_reg_0_ ( .DIN(troj60_0n10), .CLK(clk), .Q(troj60_0counter_0_) );
      DFFLES2 troj60_0counter_reg_1_ ( .DIN(troj60_0N1), .EB(troj60_0n9), .CLK(clk), .QN(troj60_0n6) );
      DFFLES2 troj60_0counter_reg_2_ ( .DIN(troj60_0N2), .EB(troj60_0n9), .CLK(clk), .QN(troj60_0n8) );
      DFFLES2 troj60_0counter_reg_3_ ( .DIN(troj60_0N3), .EB(troj60_0n9), .CLK(clk), .QN(troj60_0n7) );
      DFFX2 troj60_0Trojan_out0_reg ( .DIN(troj60_0N6), .CLK(clk), .Q(Trojan_out0) );
      HI1S1 troj60_0U3 ( .DIN(Trigger_en0_0), .Q(troj60_0n9) );
      XNOR2X1 troj60_0U4 ( .DIN1(troj60_0n1), .DIN2(Trigger_en0_0), .Q(troj60_0n10) );
      AND3X1 troj60_0U5 ( .DIN1(troj60_0n2), .DIN2(troj60_0n3), .DIN3(troj60_0n4), .Q(troj60_0N6) );
      XNOR2X1 troj60_0U6 ( .DIN1(troj60_0n5), .DIN2(troj60_0n3), .Q(troj60_0N3) );
      HI1S1 troj60_0U7 ( .DIN(troj60_0n7), .Q(troj60_0n3) );
      NAND2X1 troj60_0U8 ( .DIN1(troj60_0n4), .DIN2(troj60_0n2), .Q(troj60_0n5) );
      HI1S1 troj60_0U9 ( .DIN(troj60_0n8), .Q(troj60_0n2) );
      XNOR2X1 troj60_0U10 ( .DIN1(troj60_0n8), .DIN2(troj60_0n4), .Q(troj60_0N2) );
      NOR2X1 troj60_0U11 ( .DIN1(troj60_0n1), .DIN2(troj60_0n6), .Q(troj60_0n4) );
      HI1S1 troj60_0U12 ( .DIN(troj60_0counter_0_), .Q(troj60_0n1) );
      XNOR2X1 troj60_0U13 ( .DIN1(troj60_0counter_0_), .DIN2(troj60_0n6), .Q(troj60_0N1) );
      XOR2X1 trojan60_0  (.DIN1(tempg6321), .DIN2(Trojan_out0), .Q(norfinresu1_output_module) );
endmodule
