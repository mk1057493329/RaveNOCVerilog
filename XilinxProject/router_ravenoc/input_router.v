module input_router (
	clk,
	arst,
	flit_req_i,
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
	input wire [ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth:0] flit_req_i;
	output reg [4:0] router_port_o;
	reg [8:0] routing_table_ff;
	reg [2:0] next_rt;
	localparam signed [31:0] ravenoc_pkg_FlitTpWidth = 2;
	localparam signed [31:0] ravenoc_pkg_MaxSzPkt = 256;
	localparam signed [31:0] ravenoc_pkg_PktWidth = ravenoc_pkg_MinBitWidth(255);
	localparam signed [31:0] ravenoc_pkg_MinDataWidth = (((ravenoc_pkg_FlitWidth - ravenoc_pkg_FlitTpWidth) - ravenoc_pkg_XWidth) - ravenoc_pkg_YWidth) - ravenoc_pkg_PktWidth;
	reg [((((ravenoc_pkg_FlitTpWidth + ravenoc_pkg_XWidth) + ravenoc_pkg_YWidth) + ravenoc_pkg_PktWidth) + ravenoc_pkg_MinDataWidth) - 1:0] flit;
	reg new_rt;
	localparam signed [31:0] ravenoc_pkg_XYAlg = 0;
	localparam signed [31:0] ravenoc_pkg_RoutingAlg = ravenoc_pkg_XYAlg;
	localparam signed [31:0] ravenoc_pkg_YXAlg = 1;
	function automatic [1:0] sv2v_cast_11F5D;
		input reg [1:0] inp;
		sv2v_cast_11F5D = inp;
	endfunction
	always @(*) begin : routing_process
		next_rt = 3'd0;
		flit = flit_req_i[ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth-:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= (ravenoc_pkg_VcWidth + 1) ? ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_VcWidth + 1)) + 1 : ((ravenoc_pkg_VcWidth + 1) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) + 1)];
		new_rt = flit_req_i[0] && (flit[ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))-:((ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) >= (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) ? ((ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) - (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)))) + 1 : ((ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) - (ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))))) + 1)] == sv2v_cast_11F5D(0));
		if (new_rt)
			if (ravenoc_pkg_RoutingAlg == ravenoc_pkg_XYAlg) begin
				if ((flit[ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))-:((ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))) >= (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)) ? ((ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))) - (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) + 1 : ((ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)) - (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) + 1)] == ROUTER_X_ID) && (flit[ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))-:((ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))) >= (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth) ? ((ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))) - (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)) + 1 : ((ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth) - (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))) + 1)] == ROUTER_Y_ID)) begin : flit_arrived_x
					next_rt = 3'd4;
				end
				else if (flit[ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))-:((ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))) >= (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)) ? ((ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))) - (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) + 1 : ((ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)) - (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) + 1)] == ROUTER_X_ID) begin : adjust_y_then
					if (flit[ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))-:((ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))) >= (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth) ? ((ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))) - (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)) + 1 : ((ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth) - (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))) + 1)] < ROUTER_Y_ID)
						next_rt = 3'd2;
					else
						next_rt = 3'd3;
				end
				else begin : adjust_x_first
					if (flit[ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))-:((ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))) >= (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)) ? ((ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))) - (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) + 1 : ((ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)) - (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) + 1)] > ROUTER_X_ID)
						next_rt = 3'd1;
					else
						next_rt = 3'd0;
				end
			end
			else if (ravenoc_pkg_RoutingAlg == ravenoc_pkg_YXAlg)
				if ((flit[ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))-:((ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))) >= (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)) ? ((ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))) - (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) + 1 : ((ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)) - (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) + 1)] == ROUTER_X_ID) && (flit[ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))-:((ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))) >= (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth) ? ((ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))) - (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)) + 1 : ((ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth) - (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))) + 1)] == ROUTER_Y_ID)) begin : flit_arrived_y
					next_rt = 3'd4;
				end
				else if (flit[ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))-:((ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))) >= (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth) ? ((ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))) - (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)) + 1 : ((ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth) - (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))) + 1)] == ROUTER_Y_ID) begin : adjust_x_then
					if (flit[ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))-:((ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))) >= (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)) ? ((ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))) - (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) + 1 : ((ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)) - (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) + 1)] < ROUTER_X_ID)
						next_rt = 3'd0;
					else
						next_rt = 3'd1;
				end
				else begin : adjust_y_first
					if (flit[ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))-:((ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))) >= (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth) ? ((ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))) - (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)) + 1 : ((ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth) - (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))) + 1)] > ROUTER_Y_ID)
						next_rt = 3'd3;
					else
						next_rt = 3'd2;
				end
	end
	always @(*) begin : router_mapping_control
		router_port_o = 1'sb0;
		if (new_rt)
			case (next_rt)
				3'd0: router_port_o[4] = 1'sb1;
				3'd1: router_port_o[3] = 1'sb1;
				3'd2: router_port_o[2] = 1'sb1;
				3'd3: router_port_o[1] = 1'sb1;
				3'd4: router_port_o[0] = 1'sb1;
				default: router_port_o = 1'sb0;
			endcase
		else if (flit_req_i[0])
			case (routing_table_ff[flit_req_i[ravenoc_pkg_VcWidth-:(ravenoc_pkg_VcWidth >= 1 ? ravenoc_pkg_VcWidth : 2 - ravenoc_pkg_VcWidth)] * 3+:3])
				3'd0: router_port_o[4] = 1'sb1;
				3'd1: router_port_o[3] = 1'sb1;
				3'd2: router_port_o[2] = 1'sb1;
				3'd3: router_port_o[1] = 1'sb1;
				3'd4: router_port_o[0] = 1'sb1;
				default: router_port_o = 1'sb0;
			endcase
	end
	always @(posedge clk or posedge arst)
		if (arst)
			routing_table_ff <= 1'sb0;
		else if (new_rt)
			routing_table_ff[flit_req_i[ravenoc_pkg_VcWidth-:(ravenoc_pkg_VcWidth >= 1 ? ravenoc_pkg_VcWidth : 2 - ravenoc_pkg_VcWidth)] * 3+:3] <= next_rt;
endmodule
