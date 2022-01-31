module input_datapath (
	clk,
	arst,
	fin_req_i,
	fin_resp_o,
	fout_req_o,
	fout_resp_i
);
	input clk;
	input arst;
	localparam signed [31:0] ravenoc_pkg_FlitWidth = 34;
	function automatic integer ravenoc_pkg_MinBitWidth;
		input reg signed [31:0] val;
		reg signed [31:0] bit_width;
		begin
			for (bit_width = 0; val > 0; bit_width = bit_width + 1)
				val = val >> 1;
			ravenoc_pkg_MinBitWidth = bit_width;
		end
	endfunction
	localparam signed [31:0] ravenoc_pkg_NumVirtChn = 3;
	localparam signed [31:0] ravenoc_pkg_VcWidth = ravenoc_pkg_MinBitWidth(2);
	input wire [ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth:0] fin_req_i;
	output reg [0:0] fin_resp_o;
	output reg [ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth:0] fout_req_o;
	input wire [0:0] fout_resp_i;
	reg [((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_NumVirtChn * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1)) - 1 : (ravenoc_pkg_NumVirtChn * (1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - 1)):((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)] from_input_req;
	wire [2:0] from_input_resp;
	wire [((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_NumVirtChn * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1)) - 1 : (ravenoc_pkg_NumVirtChn * (1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - 1)):((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)] to_output_req;
	reg [2:0] to_output_resp;
	reg [ravenoc_pkg_VcWidth - 1:0] vc_ch_act_in;
	reg req_in;
	reg [ravenoc_pkg_VcWidth - 1:0] vc_ch_act_out;
	reg req_out;
	genvar vc_id;
	generate
		for (vc_id = 0; vc_id < ravenoc_pkg_NumVirtChn; vc_id = vc_id + 1) begin : gen_virtual_channels
			vc_buffer u_virtual_channel_fifo(
				.clk(clk),
				.arst(arst),
				.vc_id_i(vc_id[ravenoc_pkg_VcWidth - 1:0]),
				.vc_id_o(to_output_req[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (vc_id * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - ravenoc_pkg_VcWidth) : (((vc_id * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - ravenoc_pkg_VcWidth)) + (ravenoc_pkg_VcWidth >= 1 ? ravenoc_pkg_VcWidth : 2 - ravenoc_pkg_VcWidth)) - 1)-:(ravenoc_pkg_VcWidth >= 1 ? ravenoc_pkg_VcWidth : 2 - ravenoc_pkg_VcWidth)]),
				.fdata_i(from_input_req[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (vc_id * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) : (((vc_id * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= (ravenoc_pkg_VcWidth + 1) ? ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_VcWidth + 1)) + 1 : ((ravenoc_pkg_VcWidth + 1) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) + 1)) - 1)-:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= (ravenoc_pkg_VcWidth + 1) ? ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_VcWidth + 1)) + 1 : ((ravenoc_pkg_VcWidth + 1) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) + 1)]),
				.valid_i(from_input_req[(vc_id * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)]),
				.ready_o(from_input_resp[vc_id]),
				.fdata_o(to_output_req[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (vc_id * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) : (((vc_id * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= (ravenoc_pkg_VcWidth + 1) ? ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_VcWidth + 1)) + 1 : ((ravenoc_pkg_VcWidth + 1) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) + 1)) - 1)-:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= (ravenoc_pkg_VcWidth + 1) ? ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_VcWidth + 1)) + 1 : ((ravenoc_pkg_VcWidth + 1) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) + 1)]),
				.valid_o(to_output_req[(vc_id * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)]),
				.ready_i(to_output_resp[vc_id])
			);
		end
	endgenerate
	always @(*) begin : input_mux
		from_input_req = 1'sb0;
		vc_ch_act_in = 1'sb0;
		req_in = 1'sb0;
		fin_resp_o = 1'sb0;
		begin : sv2v_autoblock_1
			reg signed [31:0] i;
			for (i = 2; i >= 0; i = i - 1)
				begin
					from_input_req[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (i[ravenoc_pkg_VcWidth - 1:0] * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) : (((i[ravenoc_pkg_VcWidth - 1:0] * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= (ravenoc_pkg_VcWidth + 1) ? ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_VcWidth + 1)) + 1 : ((ravenoc_pkg_VcWidth + 1) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) + 1)) - 1)-:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= (ravenoc_pkg_VcWidth + 1) ? ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_VcWidth + 1)) + 1 : ((ravenoc_pkg_VcWidth + 1) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) + 1)] = fin_req_i[ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth-:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= (ravenoc_pkg_VcWidth + 1) ? ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_VcWidth + 1)) + 1 : ((ravenoc_pkg_VcWidth + 1) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) + 1)];
					if (((fin_req_i[ravenoc_pkg_VcWidth-:(ravenoc_pkg_VcWidth >= 1 ? ravenoc_pkg_VcWidth : 2 - ravenoc_pkg_VcWidth)] == i[ravenoc_pkg_VcWidth - 1:0]) && fin_req_i[0]) && ~req_in) begin
						vc_ch_act_in = i[ravenoc_pkg_VcWidth - 1:0];
						req_in = 1;
					end
				end
		end
		if (req_in) begin
			from_input_req[(vc_ch_act_in * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)] = fin_req_i[0];
			from_input_req[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (vc_ch_act_in * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - ravenoc_pkg_VcWidth) : (((vc_ch_act_in * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - ravenoc_pkg_VcWidth)) + (ravenoc_pkg_VcWidth >= 1 ? ravenoc_pkg_VcWidth : 2 - ravenoc_pkg_VcWidth)) - 1)-:(ravenoc_pkg_VcWidth >= 1 ? ravenoc_pkg_VcWidth : 2 - ravenoc_pkg_VcWidth)] = vc_ch_act_in;
			fin_resp_o[0] = from_input_resp[vc_ch_act_in];
		end
		else
			fin_resp_o[0] = 1'sb1;
	end
	localparam signed [31:0] ravenoc_pkg_ZeroHighPrior = 1;
	localparam signed [31:0] ravenoc_pkg_HighPriority = ravenoc_pkg_ZeroHighPrior;
	localparam signed [31:0] ravenoc_pkg_ZeroLowPrior = 0;
	always @(*) begin : sv2v_autoblock_2
		reg [0:1] _sv2v_jump;
		_sv2v_jump = 2'b00;
		begin : router_mux
			fout_req_o = 1'sb0;
			vc_ch_act_out = 1'sb0;
			req_out = 1'sb0;
			to_output_resp = 1'sb0;
			if (ravenoc_pkg_HighPriority == ravenoc_pkg_ZeroLowPrior) begin : sv2v_autoblock_3
				reg signed [31:0] i;
				for (i = 2; i >= 0; i = i - 1)
					if (_sv2v_jump < 2'b10) begin
						_sv2v_jump = 2'b00;
						if (to_output_req[(i * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)]) begin
							vc_ch_act_out = i[ravenoc_pkg_VcWidth - 1:0];
							req_out = 1;
							_sv2v_jump = 2'b10;
						end
					end
				if (_sv2v_jump != 2'b11)
					_sv2v_jump = 2'b00;
			end
			else begin : sv2v_autoblock_4
				reg signed [31:0] i;
				for (i = 0; i < ravenoc_pkg_NumVirtChn; i = i + 1)
					if (_sv2v_jump < 2'b10) begin
						_sv2v_jump = 2'b00;
						if (to_output_req[(i * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)]) begin
							vc_ch_act_out = i[ravenoc_pkg_VcWidth - 1:0];
							req_out = 1;
							_sv2v_jump = 2'b10;
						end
					end
				if (_sv2v_jump != 2'b11)
					_sv2v_jump = 2'b00;
			end
			if (_sv2v_jump == 2'b00)
				if (req_out) begin
					fout_req_o[ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth-:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= (ravenoc_pkg_VcWidth + 1) ? ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_VcWidth + 1)) + 1 : ((ravenoc_pkg_VcWidth + 1) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) + 1)] = to_output_req[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (vc_ch_act_out * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) : (((vc_ch_act_out * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= (ravenoc_pkg_VcWidth + 1) ? ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_VcWidth + 1)) + 1 : ((ravenoc_pkg_VcWidth + 1) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) + 1)) - 1)-:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= (ravenoc_pkg_VcWidth + 1) ? ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_VcWidth + 1)) + 1 : ((ravenoc_pkg_VcWidth + 1) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) + 1)];
					fout_req_o[0] = to_output_req[(vc_ch_act_out * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)];
					fout_req_o[ravenoc_pkg_VcWidth-:(ravenoc_pkg_VcWidth >= 1 ? ravenoc_pkg_VcWidth : 2 - ravenoc_pkg_VcWidth)] = to_output_req[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (vc_ch_act_out * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - ravenoc_pkg_VcWidth) : (((vc_ch_act_out * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - ravenoc_pkg_VcWidth)) + (ravenoc_pkg_VcWidth >= 1 ? ravenoc_pkg_VcWidth : 2 - ravenoc_pkg_VcWidth)) - 1)-:(ravenoc_pkg_VcWidth >= 1 ? ravenoc_pkg_VcWidth : 2 - ravenoc_pkg_VcWidth)];
					to_output_resp[vc_ch_act_out+:1] = fout_resp_i;
				end
		end
	end
endmodule
