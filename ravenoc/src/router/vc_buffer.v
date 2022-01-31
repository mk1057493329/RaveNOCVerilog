module vc_buffer (
	clk,
	arst,
	vc_id_i,
	vc_id_o,
	fdata_i,
	valid_i,
	ready_o,
	fdata_o,
	valid_o,
	ready_i
);
	input clk;
	input arst;
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
	input [ravenoc_pkg_VcWidth - 1:0] vc_id_i;
	output reg [ravenoc_pkg_VcWidth - 1:0] vc_id_o;
	localparam signed [31:0] ravenoc_pkg_FlitWidth = 34;
	input [33:0] fdata_i;
	input valid_i;
	output reg ready_o;
	output wire [33:0] fdata_o;
	output reg valid_o;
	input ready_i;
	reg write_flit;
	wire full;
	wire empty;
	wire error;
	reg read_flit;
	reg locked_by_route_ff;
	reg next_locked;
	localparam signed [31:0] ravenoc_pkg_FlitTpWidth = 2;
	localparam signed [31:0] ravenoc_pkg_MaxSzPkt = 256;
	localparam signed [31:0] ravenoc_pkg_PktWidth = ravenoc_pkg_MinBitWidth(255);
	localparam signed [31:0] ravenoc_pkg_NoCCfgSzRows = 2;
	localparam signed [31:0] ravenoc_pkg_XWidth = ravenoc_pkg_MinBitWidth(1);
	localparam signed [31:0] ravenoc_pkg_NoCCfgSzCols = 2;
	localparam signed [31:0] ravenoc_pkg_YWidth = ravenoc_pkg_MinBitWidth(1);
	localparam signed [31:0] ravenoc_pkg_MinDataWidth = (((ravenoc_pkg_FlitWidth - ravenoc_pkg_FlitTpWidth) - ravenoc_pkg_XWidth) - ravenoc_pkg_YWidth) - ravenoc_pkg_PktWidth;
	reg [((((ravenoc_pkg_FlitTpWidth + ravenoc_pkg_XWidth) + ravenoc_pkg_YWidth) + ravenoc_pkg_PktWidth) + ravenoc_pkg_MinDataWidth) - 1:0] flit;
	localparam signed [31:0] ravenoc_pkg_FlitBuff = 2;
	fifo #(
		.SLOTS(ravenoc_pkg_FlitBuff),
		.WIDTH(ravenoc_pkg_FlitWidth)
	) u_virt_chn_fifo(
		.clk(clk),
		.arst(arst),
		.write_i(write_flit),
		.read_i(read_flit),
		.data_i(fdata_i),
		.data_o(fdata_o),
		.error_o(error),
		.full_o(full),
		.empty_o(empty),
		.ocup_o()
	);
	function automatic [1:0] sv2v_cast_78876;
		input reg [1:0] inp;
		sv2v_cast_78876 = inp;
	endfunction
	always @(*) begin
		next_locked = locked_by_route_ff;
		flit = fdata_i;
		if ((valid_i && (flit[ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))-:((ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) >= (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) ? ((ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) - (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)))) + 1 : ((ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) - (ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))))) + 1)] == sv2v_cast_78876(0))) && (flit[ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)-:((ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)) >= ravenoc_pkg_MinDataWidth ? ((ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)) - ravenoc_pkg_MinDataWidth) + 1 : (ravenoc_pkg_MinDataWidth - (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))) + 1)] != 'h0))
			next_locked = 1;
		else if (valid_i && (flit[ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))-:((ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) >= (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) ? ((ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) - (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)))) + 1 : ((ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) - (ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))))) + 1)] == sv2v_cast_78876(2)))
			next_locked = 0;
	end
	always @(*) begin
		write_flit = (~full && valid_i) && (flit[ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))-:((ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) >= (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) ? ((ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) - (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)))) + 1 : ((ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) - (ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))))) + 1)] == sv2v_cast_78876(0) ? ~locked_by_route_ff : 1'b1);
		ready_o = ~full && (flit[ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))-:((ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) >= (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) ? ((ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1))))) - (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth)))) + 1 : ((ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + ravenoc_pkg_MinDataWidth))) - (ravenoc_pkg_FlitTpWidth + (ravenoc_pkg_XWidth + (ravenoc_pkg_YWidth + (ravenoc_pkg_PktWidth + (ravenoc_pkg_MinDataWidth - 1)))))) + 1)] == sv2v_cast_78876(0) ? ~locked_by_route_ff : 1'b1);
		valid_o = ~empty;
		read_flit = valid_o && ready_i;
		vc_id_o = vc_id_i;
	end
	always @(posedge clk or posedge arst)
		if (arst)
			locked_by_route_ff <= 1'sb0;
		else
			locked_by_route_ff <= next_locked;
endmodule
