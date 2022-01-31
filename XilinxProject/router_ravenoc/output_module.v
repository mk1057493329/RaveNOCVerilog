module output_module (
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
	input wire [((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (4 * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1)) - 1 : (4 * (1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - 1)):((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)] fin_req_i;
	output reg [3:0] fin_resp_o;
	output reg [ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth:0] fout_req_o;
	input wire [0:0] fout_resp_i;
	reg [11:0] valid_from_im;
	wire [11:0] grant_im;
	reg [2:0] tail_flit_im;
	reg [ravenoc_pkg_VcWidth - 1:0] vc_ch_act_out;
	reg req_out;
	localparam signed [31:0] ravenoc_pkg_FlitTpWidth = 2;
	localparam signed [31:0] ravenoc_pkg_MaxSzPkt = 256;
	localparam signed [31:0] ravenoc_pkg_PktWidth = ravenoc_pkg_MinBitWidth(255);
	localparam signed [31:0] ravenoc_pkg_NoCCfgSzRows = 2;
	localparam signed [31:0] ravenoc_pkg_XWidth = ravenoc_pkg_MinBitWidth(1);
	localparam signed [31:0] ravenoc_pkg_NoCCfgSzCols = 2;
	localparam signed [31:0] ravenoc_pkg_YWidth = ravenoc_pkg_MinBitWidth(1);
	localparam signed [31:0] ravenoc_pkg_MinDataWidth = (((ravenoc_pkg_FlitWidth - ravenoc_pkg_FlitTpWidth) - ravenoc_pkg_XWidth) - ravenoc_pkg_YWidth) - ravenoc_pkg_PktWidth;
	reg [((((ravenoc_pkg_FlitTpWidth + ravenoc_pkg_XWidth) + ravenoc_pkg_YWidth) + ravenoc_pkg_PktWidth) + ravenoc_pkg_MinDataWidth) - 1:0] head_flit;
	genvar vc_id;
	generate
		for (vc_id = 0; vc_id < ravenoc_pkg_NumVirtChn; vc_id = vc_id + 1) begin : gen_rr_arbiters
			rr_arbiter #(.N_OF_INPUTS(4)) u_round_robin_arbiter(
				.clk(clk),
				.arst(arst),
				.update_i(tail_flit_im[vc_id[ravenoc_pkg_VcWidth - 1:0]]),
				.req_i(valid_from_im[vc_id[ravenoc_pkg_VcWidth - 1:0] * 4+:4]),
				.grant_o(grant_im[vc_id[ravenoc_pkg_VcWidth - 1:0] * 4+:4])
			);
		end
	endgenerate
	function automatic [1:0] sv2v_cast_C8076;
		input reg [1:0] inp;
		sv2v_cast_C8076 = inp;
	endfunction
	always @(*) begin : sv2v_autoblock_1
		reg [0:1] _sv2v_jump;
		_sv2v_jump = 2'b00;
		begin : input_setup
			valid_from_im = 1'sb0;
			head_flit = 1'sb0;
			tail_flit_im = 1'sb0;
			begin : sv2v_autoblock_2
				reg signed [31:0] in_mod;
				for (in_mod = 0; in_mod < 4; in_mod = in_mod + 1)
					begin : sv2v_autoblock_3
						reg signed [31:0] vc_channel;
						for (vc_channel = 0; vc_channel < ravenoc_pkg_NumVirtChn; vc_channel = vc_channel + 1)
							if (fin_req_i[(in_mod[1:0] * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)] && (fin_req_i[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (in_mod[1:0] * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - ravenoc_pkg_VcWidth) : (((in_mod[1:0] * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - ravenoc_pkg_VcWidth)) + (ravenoc_pkg_VcWidth >= 1 ? ravenoc_pkg_VcWidth : 2 - ravenoc_pkg_VcWidth)) - 1)-:(ravenoc_pkg_VcWidth >= 1 ? ravenoc_pkg_VcWidth : 2 - ravenoc_pkg_VcWidth)] == vc_channel[ravenoc_pkg_VcWidth - 1:0]))
								valid_from_im[(vc_channel[ravenoc_pkg_VcWidth - 1:0] * 4) + in_mod[1:0]] = 1'b1;
					end
			end
			begin : sv2v_autoblock_4
				reg signed [31:0] vc_channel;
				for (vc_channel = 0; vc_channel < ravenoc_pkg_NumVirtChn; vc_channel = vc_channel + 1)
					if (_sv2v_jump < 2'b10) begin
						_sv2v_jump = 2'b00;
						begin : sv2v_autoblock_5
							reg signed [31:0] in_mod;
							begin : sv2v_autoblock_6
								reg [0:1] _sv2v_jump_1;
								_sv2v_jump_1 = _sv2v_jump;
								for (in_mod = 0; in_mod < 4; in_mod = in_mod + 1)
									if (_sv2v_jump < 2'b10) begin
										_sv2v_jump = 2'b00;
										if (grant_im[(vc_channel[ravenoc_pkg_VcWidth - 1:0] * 4) + in_mod[1:0]]) begin
											head_flit = fin_req_i[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (in_mod[1:0] * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) : (((in_mod[1:0] * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= (ravenoc_pkg_VcWidth + 1) ? ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_VcWidth + 1)) + 1 : ((ravenoc_pkg_VcWidth + 1) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) + 1)) - 1)-:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= (ravenoc_pkg_VcWidth + 1) ? ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_VcWidth + 1)) + 1 : ((ravenoc_pkg_VcWidth + 1) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) + 1)];
											tail_flit_im[vc_channel[ravenoc_pkg_VcWidth - 1:0]] = fout_resp_i[0] && ((head_flit[ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))-:((ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) >= (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) ? ((ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) - (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)))) + 1 : ((ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) - (ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))))) + 1)] == sv2v_cast_C8076(2)) || ((head_flit[ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))-:((ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) >= (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) ? ((ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) - (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)))) + 1 : ((ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) - (ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))))) + 1)] == sv2v_cast_C8076(0)) && (head_flit[ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)-:((ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)) >= ravenoc_pkg_MinDataWidth ? ((ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)) - ravenoc_pkg_MinDataWidth) + 1 : (ravenoc_pkg_MinDataWidth - (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))) + 1)] == 'h0)));
											_sv2v_jump = 2'b10;
										end
									end
								if (_sv2v_jump != 2'b11)
									_sv2v_jump = _sv2v_jump_1;
							end
						end
					end
				if (_sv2v_jump != 2'b11)
					_sv2v_jump = 2'b00;
			end
		end
	end
	localparam signed [31:0] ravenoc_pkg_ZeroHighPrior = 1;
	localparam signed [31:0] ravenoc_pkg_HighPriority = ravenoc_pkg_ZeroHighPrior;
	localparam signed [31:0] ravenoc_pkg_ZeroLowPrior = 0;
	always @(*) begin : sv2v_autoblock_7
		reg [0:1] _sv2v_jump;
		_sv2v_jump = 2'b00;
		begin : output_mux_winner_hp
			fout_req_o = 1'sb0;
			vc_ch_act_out = 1'sb0;
			req_out = 1'sb0;
			fin_resp_o = 1'sb0;
			if (ravenoc_pkg_HighPriority == ravenoc_pkg_ZeroLowPrior) begin : sv2v_autoblock_8
				reg signed [31:0] i;
				for (i = 2; i >= 0; i = i - 1)
					if (_sv2v_jump < 2'b10) begin
						_sv2v_jump = 2'b00;
						if (|grant_im[i[ravenoc_pkg_VcWidth - 1:0] * 4+:4]) begin
							vc_ch_act_out = i[ravenoc_pkg_VcWidth - 1:0];
							req_out = 1;
							_sv2v_jump = 2'b10;
						end
					end
				if (_sv2v_jump != 2'b11)
					_sv2v_jump = 2'b00;
			end
			else begin : sv2v_autoblock_9
				reg signed [31:0] i;
				for (i = 0; i < ravenoc_pkg_NumVirtChn; i = i + 1)
					if (_sv2v_jump < 2'b10) begin
						_sv2v_jump = 2'b00;
						if (|grant_im[i[ravenoc_pkg_VcWidth - 1:0] * 4+:4]) begin
							vc_ch_act_out = i[ravenoc_pkg_VcWidth - 1:0];
							req_out = 1;
							_sv2v_jump = 2'b10;
						end
					end
				if (_sv2v_jump != 2'b11)
					_sv2v_jump = 2'b00;
			end
			if (_sv2v_jump == 2'b00)
				if (req_out) begin : sv2v_autoblock_10
					reg signed [31:0] i;
					for (i = 0; i < 4; i = i + 1)
						if (_sv2v_jump < 2'b10) begin
							_sv2v_jump = 2'b00;
							if (grant_im[(vc_ch_act_out * 4) + i[1:0]]) begin
								fout_req_o[ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth-:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= (ravenoc_pkg_VcWidth + 1) ? ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_VcWidth + 1)) + 1 : ((ravenoc_pkg_VcWidth + 1) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) + 1)] = fin_req_i[((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (i[1:0] * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) : (((i[1:0] * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth : (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= (ravenoc_pkg_VcWidth + 1) ? ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_VcWidth + 1)) + 1 : ((ravenoc_pkg_VcWidth + 1) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) + 1)) - 1)-:((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= (ravenoc_pkg_VcWidth + 1) ? ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) - (ravenoc_pkg_VcWidth + 1)) + 1 : ((ravenoc_pkg_VcWidth + 1) - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)) + 1)];
								fout_req_o[0] = fin_req_i[(i[1:0] * ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) + 1 : 1 - (ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth))) + ((ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth) >= 0 ? 0 : ravenoc_pkg_FlitWidth + ravenoc_pkg_VcWidth)];
								fout_req_o[ravenoc_pkg_VcWidth-:(ravenoc_pkg_VcWidth >= 1 ? ravenoc_pkg_VcWidth : 2 - ravenoc_pkg_VcWidth)] = vc_ch_act_out;
								fin_resp_o[i[1:0]+:1] = fout_resp_i;
								_sv2v_jump = 2'b10;
							end
						end
					if (_sv2v_jump != 2'b11)
						_sv2v_jump = 2'b00;
				end
		end
	end
endmodule
