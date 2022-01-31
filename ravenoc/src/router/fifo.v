module fifo (
	clk,
	arst,
	write_i,
	read_i,
	data_i,
	data_o,
	error_o,
	full_o,
	empty_o,
	ocup_o
);
	parameter signed [31:0] SLOTS = 2;
	parameter signed [31:0] WIDTH = 8;
	input clk;
	input arst;
	input write_i;
	input read_i;
	input [WIDTH - 1:0] data_i;
	output reg [WIDTH - 1:0] data_o;
	output reg error_o;
	output reg full_o;
	output reg empty_o;
	output reg [$clog2((SLOTS > 1 ? SLOTS : 2)):0] ocup_o;
	reg [(SLOTS * WIDTH) - 1:0] fifo_ff;
	reg [$clog2((SLOTS > 1 ? SLOTS : 2)):0] write_ptr_ff;
	reg [$clog2((SLOTS > 1 ? SLOTS : 2)):0] read_ptr_ff;
	reg [$clog2((SLOTS > 1 ? SLOTS : 2)):0] next_write_ptr;
	reg [$clog2((SLOTS > 1 ? SLOTS : 2)):0] next_read_ptr;
	reg [$clog2((SLOTS > 1 ? SLOTS : 2)):0] fifo_ocup;
	always @(*) begin
		next_read_ptr = read_ptr_ff;
		next_write_ptr = write_ptr_ff;
		if (SLOTS == 1) begin
			empty_o = write_ptr_ff == read_ptr_ff;
			full_o = write_ptr_ff[0] != read_ptr_ff[0];
			data_o = (empty_o ? {WIDTH {1'sb0}} : fifo_ff[0+:WIDTH]);
		end
		else begin
			empty_o = write_ptr_ff == read_ptr_ff;
			full_o = (write_ptr_ff[$clog2((SLOTS > 1 ? SLOTS : 2)) - 1:0] == read_ptr_ff[$clog2((SLOTS > 1 ? SLOTS : 2)) - 1:0]) && (write_ptr_ff[$clog2((SLOTS > 1 ? SLOTS : 2))] != read_ptr_ff[$clog2((SLOTS > 1 ? SLOTS : 2))]);
			data_o = (empty_o ? {WIDTH {1'sb0}} : fifo_ff[read_ptr_ff[$clog2((SLOTS > 1 ? SLOTS : 2)) - 1:0] * WIDTH+:WIDTH]);
		end
		if (write_i && ~full_o)
			next_write_ptr = write_ptr_ff + 'd1;
		if (read_i && ~empty_o)
			next_read_ptr = read_ptr_ff + 'd1;
		error_o = (write_i && full_o) || (read_i && empty_o);
		fifo_ocup = write_ptr_ff - read_ptr_ff;
		ocup_o = fifo_ocup;
	end
	always @(posedge clk or posedge arst)
		if (arst) begin
			write_ptr_ff <= 1'sb0;
			read_ptr_ff <= 1'sb0;
			fifo_ff <= 1'sb0;
		end
		else begin
			write_ptr_ff <= next_write_ptr;
			read_ptr_ff <= next_read_ptr;
			if (write_i && ~full_o)
				if (SLOTS == 1)
					fifo_ff[0+:WIDTH] <= data_i;
				else
					fifo_ff[write_ptr_ff[$clog2((SLOTS > 1 ? SLOTS : 2)) - 1:0] * WIDTH+:WIDTH] <= data_i;
		end
	initial begin
		begin : illegal_fifo_slot
			
		end
		begin : min_fifo_size
			
		end
	end
endmodule
