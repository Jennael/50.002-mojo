/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module check_8 (
    input rst,
    input clk,
    input [4:0] adata,
    input [4:0] bdata,
    input [0:0] calc,
    output reg [4:0] address,
    output reg [1:0] enter_led,
    output reg [1:0] guess_led,
    output reg [3:0] count,
    output reg [3:0] tens,
    output reg [3:0] ones
  );
  
  
  
  reg [3:0] M_val_d, M_val_q = 1'h0;
  reg [3:0] M_ovf_d, M_ovf_q = 1'h0;
  reg [15:0] M_aval_d, M_aval_q = 1'h0;
  reg [15:0] M_bval_d, M_bval_q = 1'h0;
  reg [5:0] M_alufn_d, M_alufn_q = 1'h0;
  reg [27:0] M_timer_d, M_timer_q = 1'h0;
  reg [4:0] M_entry_count_d, M_entry_count_q = 1'h0;
  localparam IDLE_checking = 2'd0;
  localparam CHECK_checking = 2'd1;
  localparam SCORE_checking = 2'd2;
  
  reg [1:0] M_checking_d, M_checking_q = IDLE_checking;
  
  wire [16-1:0] M_alu1_alu_output;
  reg [6-1:0] M_alu1_alufn;
  reg [16-1:0] M_alu1_a;
  reg [16-1:0] M_alu1_b;
  alu_13 alu1 (
    .alufn(M_alu1_alufn),
    .a(M_alu1_a),
    .b(M_alu1_b),
    .alu_output(M_alu1_alu_output)
  );
  
  always @* begin
    M_checking_d = M_checking_q;
    M_val_d = M_val_q;
    M_entry_count_d = M_entry_count_q;
    M_bval_d = M_bval_q;
    M_alufn_d = M_alufn_q;
    M_timer_d = M_timer_q;
    M_aval_d = M_aval_q;
    M_ovf_d = M_ovf_q;
    
    enter_led = 2'h3;
    guess_led = 2'h3;
    address = M_entry_count_q;
    count = M_alu1_alu_output[0+3-:4];
    M_aval_d = {11'h000, adata};
    M_bval_d = {11'h000, bdata};
    M_alufn_d = 6'h33;
    tens = M_ovf_q;
    ones = M_val_q;
    M_alu1_a = M_aval_q;
    M_alu1_b = M_bval_q;
    M_alu1_alufn = M_alufn_q;
    
    case (M_checking_q)
      IDLE_checking: begin
        M_ovf_d = 1'h0;
        M_val_d = 1'h0;
        enter_led[0+0-:1] = 1'h0;
        M_entry_count_d = 1'h0;
        if (calc == 1'h1) begin
          M_checking_d = CHECK_checking;
        end
      end
      CHECK_checking: begin
        M_timer_d = M_timer_q + 1'h1;
        if (calc == 1'h0) begin
          M_checking_d = IDLE_checking;
        end
        M_aval_d = {11'h000, adata};
        M_bval_d = {11'h000, bdata};
        M_alufn_d = 6'h33;
        if (M_timer_q[15+0-:1] == 1'h1) begin
          if (M_alu1_alu_output == 1'h1) begin
            M_timer_d = 1'h0;
            M_checking_d = SCORE_checking;
          end else begin
            guess_led[1+0-:1] = 1'h0;
            M_entry_count_d = M_entry_count_q + 1'h1;
            M_timer_d = 1'h0;
          end
        end
      end
      SCORE_checking: begin
        guess_led[0+0-:1] = 1'h0;
        M_timer_d = M_timer_q + 1'h1;
        if (calc == 1'h0) begin
          M_checking_d = IDLE_checking;
        end
        if (M_val_q == 4'h9) begin
          M_val_d = 1'h0;
          M_aval_d = M_ovf_q;
          M_bval_d = 1'h1;
          M_alufn_d = 6'h00;
          if (M_timer_q[15+0-:1] == 1'h1) begin
            M_ovf_d = M_alu1_alu_output[0+3-:4];
            M_entry_count_d = M_entry_count_q + 1'h1;
            M_timer_d = 1'h0;
            M_checking_d = CHECK_checking;
          end
        end else begin
          M_aval_d = M_val_q;
          M_bval_d = 1'h1;
          M_alufn_d = 6'h00;
          if (M_timer_q[15+0-:1] == 1'h1) begin
            M_val_d = M_alu1_alu_output[0+3-:4];
            M_entry_count_d = M_entry_count_q + 1'h1;
            M_timer_d = 1'h0;
            M_checking_d = CHECK_checking;
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_entry_count_q <= 1'h0;
    end else begin
      M_entry_count_q <= M_entry_count_d;
    end
  end
  
  
  always @(posedge clk) begin
    M_checking_q <= M_checking_d;
    
    if (rst == 1'b1) begin
      M_val_q <= 1'h0;
      M_ovf_q <= 1'h0;
      M_aval_q <= 1'h0;
      M_bval_q <= 1'h0;
      M_alufn_q <= 1'h0;
      M_timer_q <= 1'h0;
    end else begin
      M_val_q <= M_val_d;
      M_ovf_q <= M_ovf_d;
      M_aval_q <= M_aval_d;
      M_bval_q <= M_bval_d;
      M_alufn_q <= M_alufn_d;
      M_timer_q <= M_timer_d;
    end
  end
  
endmodule
