module router_ravenoc (
	clk,
	arst,
	north_send,
	north_recv,
	south_send,
	south_recv,
	west_send,
	west_recv,
	east_send,
	east_recv,
	local_send,
	local_recv
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
	input north_send;
	reg north_recv_resp;
	reg north_recv_req;
	reg north_send_resp;
	reg north_send_req;
	input north_recv;
	input south_send;
	input south_recv;
	reg south_recv_resp;
	reg south_recv_req;
	reg south_send_resp;
	reg south_send_req;
	input west_send;
	reg west_recv_resp;
	reg west_recv_req;
	reg west_send_resp;
	reg west_send_req;
	input west_recv;
	input east_send;
	input east_recv;
	reg east_recv_resp;
	reg east_recv_req;
	reg east_send_resp;
	reg east_send_req;
	input local_send;
	input local_recv;
	reg local_recv_resp;
	reg local_recv_req;
	reg local_send_resp;
	reg local_send_req;
	
	localparam signed [31:0] ravenoc_pkg_FlitWidth = 34;
	localparam signed [31:0] ravenoc_pkg_NumVirtChn = 3;
	localparam signed [31:0] ravenoc_pkg_VcWidth = ravenoc_pkg_MinBitWidth(2);
	wire [((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (5 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1)) - 1 : (5 * (1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - 1)):((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)] int_req_v;
	reg [4:0] int_resp_v;
	wire [24:0] int_route_v;
	reg [((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (20 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1)) - 1 : (20 * (1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - 1)):((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)] int_map_req_v;
	wire [19:0] int_map_resp_v;
	reg [((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (5 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1)) - 1 : (5 * (1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - 1)):((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)] ext_req_v_i;
	wire [4:0] ext_resp_v_o;
	wire [((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (5 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1)) - 1 : (5 * (1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - 1)):((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)] ext_req_v_o;
	reg [4:0] ext_resp_v_i;
	input_module #(
		.ROUTER_X_ID(ROUTER_X_ID),
		.ROUTER_Y_ID(ROUTER_Y_ID)
	) u_input_north(
		.clk(clk),
		.arst(arst),
		.fin_req_i(ext_req_v_i[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd0 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))]),
		.fin_resp_o(ext_resp_v_o[3'd0+:1]),
		.fout_req_o(int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd0 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))]),
		.fout_resp_i(int_resp_v[3'd0+:1]),
		.router_port_o(int_route_v[3'd0 * 5+:5])
	);
	input_module #(
		.ROUTER_X_ID(ROUTER_X_ID),
		.ROUTER_Y_ID(ROUTER_Y_ID)
	) u_input_south(
		.clk(clk),
		.arst(arst),
		.fin_req_i(ext_req_v_i[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd1 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))]),
		.fin_resp_o(ext_resp_v_o[3'd1+:1]),
		.fout_req_o(int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd1 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))]),
		.fout_resp_i(int_resp_v[3'd1+:1]),
		.router_port_o(int_route_v[3'd1 * 5+:5])
	);
	input_module #(
		.ROUTER_X_ID(ROUTER_X_ID),
		.ROUTER_Y_ID(ROUTER_Y_ID)
	) u_input_west(
		.clk(clk),
		.arst(arst),
		.fin_req_i(ext_req_v_i[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd2 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))]),
		.fin_resp_o(ext_resp_v_o[3'd2+:1]),
		.fout_req_o(int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd2 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))]),
		.fout_resp_i(int_resp_v[3'd2+:1]),
		.router_port_o(int_route_v[3'd2 * 5+:5])
	);
	input_module #(
		.ROUTER_X_ID(ROUTER_X_ID),
		.ROUTER_Y_ID(ROUTER_Y_ID)
	) u_input_east(
		.clk(clk),
		.arst(arst),
		.fin_req_i(ext_req_v_i[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd3 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))]),
		.fin_resp_o(ext_resp_v_o[3'd3+:1]),
		.fout_req_o(int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd3 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))]),
		.fout_resp_i(int_resp_v[3'd3+:1]),
		.router_port_o(int_route_v[3'd3 * 5+:5])
	);
	input_module #(
		.ROUTER_X_ID(ROUTER_X_ID),
		.ROUTER_Y_ID(ROUTER_Y_ID)
	) u_input_local(
		.clk(clk),
		.arst(arst),
		.fin_req_i(ext_req_v_i[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd4 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))]),
		.fin_resp_o(ext_resp_v_o[3'd4+:1]),
		.fout_req_o(int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd4 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))]),
		.fout_resp_i(int_resp_v[3'd4+:1]),
		.router_port_o(int_route_v[3'd4 * 5+:5])
	);
	output_module u_output_north(
		.clk(clk),
		.arst(arst),
		.fin_req_i(int_map_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * (3'd0 * 4))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * 4]),
		.fin_resp_o(int_map_resp_v[3'd0 * 4+:4]),
		.fout_req_o(ext_req_v_o[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd0 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))]),
		.fout_resp_i(ext_resp_v_i[3'd0+:1])
	);
	output_module u_output_south(
		.clk(clk),
		.arst(arst),
		.fin_req_i(int_map_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * (3'd1 * 4))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * 4]),
		.fin_resp_o(int_map_resp_v[3'd1 * 4+:4]),
		.fout_req_o(ext_req_v_o[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd1 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))]),
		.fout_resp_i(ext_resp_v_i[3'd1+:1])
	);
	output_module u_output_west(
		.clk(clk),
		.arst(arst),
		.fin_req_i(int_map_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * (3'd2 * 4))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * 4]),
		.fin_resp_o(int_map_resp_v[3'd2 * 4+:4]),
		.fout_req_o(ext_req_v_o[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd2 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))]),
		.fout_resp_i(ext_resp_v_i[3'd2+:1])
	);
	output_module u_output_east(
		.clk(clk),
		.arst(arst),
		.fin_req_i(int_map_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * (3'd3 * 4))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * 4]),
		.fin_resp_o(int_map_resp_v[3'd3 * 4+:4]),
		.fout_req_o(ext_req_v_o[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd3 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))]),
		.fout_resp_i(ext_resp_v_i[3'd3+:1])
	);
	output_module u_output_local(
		.clk(clk),
		.arst(arst),
		.fin_req_i(int_map_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * (3'd4 * 4))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * 4]),
		.fin_resp_o(int_map_resp_v[3'd4 * 4+:4]),
		.fout_req_o(ext_req_v_o[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd4 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))]),
		.fout_resp_i(ext_resp_v_i[3'd4+:1])
	);
	always @(*) begin : mapping_input_ports
		ext_req_v_i[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd0 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] = north_recv_req;
		north_recv_resp = ext_resp_v_o[3'd0+:1];
		ext_req_v_i[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd1 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] = south_recv_req;
		south_recv_resp = ext_resp_v_o[3'd1+:1];
		ext_req_v_i[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd2 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] = west_recv_req;
		west_recv_resp = ext_resp_v_o[3'd2+:1];
		ext_req_v_i[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd3 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] = east_recv_req;
		east_recv_resp = ext_resp_v_o[3'd3+:1];
		north_send_req = ext_req_v_o[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd0 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))];
		ext_resp_v_i[3'd0+:1] = north_send_resp;
		south_send_req = ext_req_v_o[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd1 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))];
		ext_resp_v_i[3'd1+:1] = south_send_resp;
		west_send_req = ext_req_v_o[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd2 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))];
		ext_resp_v_i[3'd2+:1] = west_send_resp;
		east_send_req = ext_req_v_o[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd3 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))];
		ext_resp_v_i[3'd3+:1] = east_send_resp;
		local_recv_resp = ext_resp_v_o[3'd4+:1];
		ext_req_v_i[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd4 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] = local_recv_req;
		local_send_req = ext_req_v_o[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd4 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))];
		ext_resp_v_i[3'd4+:1] = local_send_resp;
	end
	always @(*) begin : mapping_output_ports
		int_resp_v = 1'sb0;
		int_map_req_v = 1'sb0;
		int_map_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * (3'd0 * 4))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * 4] = {(int_route_v[(3'd1 * 5) + 4] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd1 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}}), (int_route_v[(3'd2 * 5) + 4] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd2 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}}), (int_route_v[(3'd3 * 5) + 4] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd3 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}}), (int_route_v[(3'd4 * 5) + 4] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd4 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}})};
		if (int_route_v[(3'd1 * 5) + 4])
			int_resp_v[3'd1+:1] = int_map_resp_v[(3'd0 * 4) + 3+:1];
		if (int_route_v[(3'd2 * 5) + 4])
			int_resp_v[3'd2+:1] = int_map_resp_v[(3'd0 * 4) + 2+:1];
		if (int_route_v[(3'd3 * 5) + 4])
			int_resp_v[3'd3+:1] = int_map_resp_v[(3'd0 * 4) + 1+:1];
		if (int_route_v[(3'd4 * 5) + 4])
			int_resp_v[3'd4+:1] = int_map_resp_v[(3'd0 * 4) + 0+:1];
		int_map_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * (3'd1 * 4))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * 4] = {(int_route_v[(3'd2 * 5) + 3] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd2 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}}), (int_route_v[(3'd3 * 5) + 3] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd3 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}}), (int_route_v[(3'd4 * 5) + 3] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd4 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}}), (int_route_v[(3'd0 * 5) + 3] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd0 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}})};
		if (int_route_v[(3'd2 * 5) + 3])
			int_resp_v[3'd2+:1] = int_map_resp_v[(3'd1 * 4) + 3+:1];
		if (int_route_v[(3'd3 * 5) + 3])
			int_resp_v[3'd3+:1] = int_map_resp_v[(3'd1 * 4) + 2+:1];
		if (int_route_v[(3'd4 * 5) + 3])
			int_resp_v[3'd4+:1] = int_map_resp_v[(3'd1 * 4) + 1+:1];
		if (int_route_v[(3'd0 * 5) + 3])
			int_resp_v[3'd0+:1] = int_map_resp_v[(3'd1 * 4) + 0+:1];
		int_map_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * (3'd2 * 4))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * 4] = {(int_route_v[(3'd3 * 5) + 2] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd3 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}}), (int_route_v[(3'd4 * 5) + 2] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd4 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}}), (int_route_v[(3'd0 * 5) + 2] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd0 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}}), (int_route_v[(3'd1 * 5) + 2] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd1 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}})};
		if (int_route_v[(3'd3 * 5) + 2])
			int_resp_v[3'd3+:1] = int_map_resp_v[(3'd2 * 4) + 3+:1];
		if (int_route_v[(3'd4 * 5) + 2])
			int_resp_v[3'd4+:1] = int_map_resp_v[(3'd2 * 4) + 2+:1];
		if (int_route_v[(3'd0 * 5) + 2])
			int_resp_v[3'd0+:1] = int_map_resp_v[(3'd2 * 4) + 1+:1];
		if (int_route_v[(3'd1 * 5) + 2])
			int_resp_v[3'd1+:1] = int_map_resp_v[(3'd2 * 4) + 0+:1];
		int_map_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * (3'd3 * 4))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * 4] = {(int_route_v[(3'd4 * 5) + 1] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd4 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}}), (int_route_v[(3'd0 * 5) + 1] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd0 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}}), (int_route_v[(3'd1 * 5) + 1] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd1 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}}), (int_route_v[(3'd2 * 5) + 1] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd2 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}})};
		if (int_route_v[(3'd4 * 5) + 1])
			int_resp_v[3'd4+:1] = int_map_resp_v[(3'd3 * 4) + 3+:1];
		if (int_route_v[(3'd0 * 5) + 1])
			int_resp_v[3'd0+:1] = int_map_resp_v[(3'd3 * 4) + 2+:1];
		if (int_route_v[(3'd1 * 5) + 1])
			int_resp_v[3'd1+:1] = int_map_resp_v[(3'd3 * 4) + 1+:1];
		if (int_route_v[(3'd2 * 5) + 1])
			int_resp_v[3'd2+:1] = int_map_resp_v[(3'd3 * 4) + 0+:1];
		int_map_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * (3'd4 * 4))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) * 4] = {(int_route_v[(3'd0 * 5) + 0] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd0 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}}), (int_route_v[(3'd1 * 5) + 0] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd1 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}}), (int_route_v[(3'd2 * 5) + 0] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd2 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}}), (int_route_v[(3'd3 * 5) + 0] ? int_req_v[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + (3'd3 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)))+:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))] : {((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) {1'sb0}})};
		if (int_route_v[(3'd0 * 5) + 0])
			int_resp_v[3'd0+:1] = int_map_resp_v[(3'd4 * 4) + 3+:1];
		if (int_route_v[(3'd1 * 5) + 0])
			int_resp_v[3'd1+:1] = int_map_resp_v[(3'd4 * 4) + 2+:1];
		if (int_route_v[(3'd2 * 5) + 0])
			int_resp_v[3'd2+:1] = int_map_resp_v[(3'd4 * 4) + 1+:1];
		if (int_route_v[(3'd3 * 5) + 0])
			int_resp_v[3'd3+:1] = int_map_resp_v[(3'd4 * 4) + 0+:1];
	end
endmodule
