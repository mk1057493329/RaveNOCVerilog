module input_module (
	clk,
	arst,
	fin_req_i,
	fin_resp_o,
	fout_req_o,
	fout_resp_i,
	router_port_o
);
	function automatic integer ravenoc_pkg_MinBitWidth;
		input reg signed [31:0] val;
		reg signed [31:0] bit_width;
		begin
			for (bit_width = 0; val > 0; bit_width = bit_width + 1)
				val = val >> 1;
			ravenoc_pkg_MinBitWidth = bit_width;
		end
	endfunction
	localparam signed [31:0] ravenoc_pkg_NoCCfgSzRows = 2;
	localparam signed [31:0] ravenoc_pkg_XWidth = ravenoc_pkg_MinBitWidth(1);
	parameter [ravenoc_pkg_XWidth - 1:0] ROUTER_X_ID = 0;
	localparam signed [31:0] ravenoc_pkg_NoCCfgSzCols = 2;
	localparam signed [31:0] ravenoc_pkg_YWidth = ravenoc_pkg_MinBitWidth(1);
	parameter [ravenoc_pkg_YWidth - 1:0] ROUTER_Y_ID = 0;
	input clk;
	input arst;
	localparam signed [31:0] ravenoc_pkg_FlitWidth = 34;
	localparam signed [31:0] ravenoc_pkg_NumVirtChn = 3;
	localparam signed [31:0] ravenoc_pkg_VcWidth = ravenoc_pkg_MinBitWidth(2);
	input wire [ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth:0] fin_req_i;
	output wire [0:0] fin_resp_o;
	output wire [ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth:0] fout_req_o;
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
		.ROUTER_X_ID(ROUTER_X_ID),
		.ROUTER_Y_ID(ROUTER_Y_ID)
	) u_input_router(
		.clk(clk),
		.arst(arst),
		.flit_req_i(fout_req_o),
		.router_port_o(router_port_o)
	);
endmodule
