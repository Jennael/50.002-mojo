/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    input [4:0] button,
    output reg red_led,
    output reg [1:0] enter_led,
    output reg [1:0] guess_led,
    output reg [5:0] button_col,
    input [4:0] button_row,
    output reg [6:0] seven_seg,
    output reg [5:0] seg_sel,
    output reg gnd,
    output reg pwr
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [5-1:0] M_question_read_data;
  reg [5-1:0] M_question_address;
  reg [5-1:0] M_question_write_data;
  reg [1-1:0] M_question_write_en;
  simple_ram_2 #(.SIZE(3'h5), .DEPTH(6'h20)) question (
    .clk(clk),
    .address(M_question_address),
    .write_data(M_question_write_data),
    .write_en(M_question_write_en),
    .read_data(M_question_read_data)
  );
  wire [5-1:0] M_answer_read_data;
  reg [5-1:0] M_answer_address;
  reg [5-1:0] M_answer_write_data;
  reg [1-1:0] M_answer_write_en;
  simple_ram_2 #(.SIZE(3'h5), .DEPTH(6'h20)) answer (
    .clk(clk),
    .address(M_answer_address),
    .write_data(M_answer_write_data),
    .write_en(M_answer_write_en),
    .read_data(M_answer_read_data)
  );
  reg [4:0] M_entry_count_d, M_entry_count_q = 1'h0;
  reg [0:0] M_occupied_d, M_occupied_q = 1'h0;
  reg [24:0] M_delay_d, M_delay_q = 1'h0;
  localparam IDLE_game = 2'd0;
  localparam INPUT1_game = 2'd1;
  localparam DISPLAY_game = 2'd2;
  localparam INPUT2_game = 2'd3;
  
  reg [1:0] M_game_d, M_game_q = IDLE_game;
  wire [6-1:0] M_detect_button_col;
  wire [2-1:0] M_detect_guessled;
  wire [5-1:0] M_detect_somechar;
  reg [5-1:0] M_detect_button_row;
  input_capture_4 detect (
    .clk(clk),
    .rst(rst),
    .button_row(M_detect_button_row),
    .button_col(M_detect_button_col),
    .guessled(M_detect_guessled),
    .somechar(M_detect_somechar)
  );
  wire [7-1:0] M_seg_seg;
  wire [6-1:0] M_seg_sel;
  reg [24-1:0] M_seg_values;
  multi_seven_seg_5 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .seg(M_seg_seg),
    .sel(M_seg_sel)
  );
  wire [1-1:0] M_dm_red_led;
  wire [5-1:0] M_dm_ra;
  wire [4-1:0] M_dm_value;
  reg [5-1:0] M_dm_data;
  reg [1-1:0] M_dm_play;
  reg [26-1:0] M_dm_incr;
  displaymorse_6 dm (
    .clk(clk),
    .rst(rst),
    .data(M_dm_data),
    .play(M_dm_play),
    .incr(M_dm_incr),
    .red_led(M_dm_red_led),
    .ra(M_dm_ra),
    .value(M_dm_value)
  );
  wire [4-1:0] M_settings_speed_disp;
  wire [4-1:0] M_settings_length_disp;
  wire [1-1:0] M_settings_start;
  wire [26-1:0] M_settings_increment;
  reg [5-1:0] M_settings_button;
  settings_7 settings (
    .clk(clk),
    .rst(rst),
    .button(M_settings_button),
    .speed_disp(M_settings_speed_disp),
    .length_disp(M_settings_length_disp),
    .start(M_settings_start),
    .increment(M_settings_increment)
  );
  
  always @* begin
    M_game_d = M_game_q;
    M_occupied_d = M_occupied_q;
    M_entry_count_d = M_entry_count_q;
    M_delay_d = M_delay_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    red_led = 1'h0;
    enter_led = 2'h3;
    guess_led = 2'h3;
    M_seg_values = {4'hf, M_entry_count_q[0+3-:4], 4'hf, 4'hf, 4'hf, 4'hf};
    seven_seg = M_seg_seg;
    seg_sel = ~M_seg_sel;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    gnd = 1'h0;
    pwr = 1'h1;
    M_question_address = M_entry_count_q;
    M_question_write_data = 8'bxxxxxxxx;
    M_question_write_en = 1'h0;
    M_answer_address = M_entry_count_q;
    M_answer_write_data = 8'bxxxxxxxx;
    M_answer_write_en = 1'h0;
    button_col = M_detect_button_col;
    M_detect_button_row = button_row;
    guess_led = M_detect_guessled;
    M_dm_data = M_question_read_data;
    M_dm_incr = M_settings_increment;
    M_dm_play = 1'h0;
    red_led = M_dm_red_led;
    M_settings_button = 1'h0;
    
    case (M_game_q)
      IDLE_game: begin
        M_seg_values[4+3-:4] = 4'h1;
        M_settings_button = button;
        if (button[0+0-:1] == 1'h1) begin
          M_entry_count_d = 1'h0;
          M_occupied_d = 1'h0;
          M_game_d = INPUT1_game;
        end
      end
      INPUT1_game: begin
        enter_led[0+0-:1] = 1'h0;
        if (M_detect_somechar != 5'h1f && M_occupied_q == 1'h0) begin
          M_question_write_data = M_detect_somechar;
          M_question_write_en = 1'h1;
          M_occupied_d = 1'h1;
        end
        if (M_detect_somechar == 5'h1f && M_occupied_q == 1'h1) begin
          M_delay_d = M_delay_q + 1'h1;
          if (M_delay_q[18+0-:1] == 1'h1) begin
            M_entry_count_d = M_entry_count_q + 1'h1;
            M_occupied_d = 1'h0;
            M_delay_d = 1'h0;
          end
        end
        M_seg_values[4+3-:4] = M_question_read_data[0+3-:4];
        M_seg_values[16+3-:4] = M_entry_count_q[0+3-:4];
        if (button[1+0-:1] == 1'h1) begin
          M_question_write_en = 1'h0;
          M_entry_count_d = 1'h0;
          M_game_d = DISPLAY_game;
        end
      end
      DISPLAY_game: begin
        guess_led[0+0-:1] = 1'h0;
        M_seg_values[8+3-:4] = M_dm_value;
        M_seg_values[12+3-:4] = M_dm_ra[0+3-:4];
        if (M_dm_ra <= 2'h2) begin
          M_dm_play = 1'h1;
          M_question_address = M_dm_ra;
          M_dm_data = M_question_read_data;
        end else begin
          M_dm_play = 1'h0;
          M_entry_count_d = 1'h0;
          M_occupied_d = 1'h0;
          M_game_d = INPUT2_game;
        end
      end
      INPUT2_game: begin
        enter_led[0+0-:1] = 1'h0;
        if (M_detect_somechar != 5'h1f && M_occupied_q == 1'h0) begin
          M_answer_write_data = M_detect_somechar;
          M_answer_write_en = 1'h1;
          M_occupied_d = 1'h1;
        end
        if (M_detect_somechar == 5'h1f && M_occupied_q == 1'h1) begin
          M_delay_d = M_delay_q + 1'h1;
          if (M_delay_q[18+0-:1] == 1'h1) begin
            M_entry_count_d = M_entry_count_q + 1'h1;
            M_occupied_d = 1'h0;
            M_delay_d = 1'h0;
          end
        end
        M_seg_values[4+3-:4] = M_answer_read_data[0+3-:4];
        M_seg_values[16+3-:4] = M_entry_count_q[0+3-:4];
        if (button[0+0-:1] == 1'h1) begin
          M_entry_count_d = 1'h0;
          M_occupied_d = 1'h0;
          M_game_d = INPUT2_game;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_entry_count_q <= M_entry_count_d;
    M_occupied_q <= M_occupied_d;
    M_delay_q <= M_delay_d;
    
    if (rst == 1'b1) begin
      M_game_q <= 1'h0;
    end else begin
      M_game_q <= M_game_d;
    end
  end
  
endmodule
