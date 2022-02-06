module input_module (clk,arst,fin_req_i,fin_resp_o,fout_req_o,fout_resp_i,router_port_o);
	input clk;
	input arst;
	input wire [36:0] fin_req_i;
	output [0:0] fin_resp_o;
	output [36:0] fout_req_o;
	input wire [0:0] fout_resp_i;
	output wire [4:0] router_port_o;
	input_datapath u_input_datapath(
		.clk(clk),
		.arst(arst),
		.fin_req_i(fin_req_i),
		.fin_resp_o(fin_resp_o),
		.fout_req_o(fout_req_o),
		.fout_resp_i(fout_resp_i)
	);
	input_router #(
		.ROUTER_X_ID(0),
		.ROUTER_Y_ID(0)
	) u_input_router(
		.clk(clk),
		.arst(arst),
		.flit_req_i(fout_req_o),
		.router_port_o(router_port_o)
	);
endmodule
