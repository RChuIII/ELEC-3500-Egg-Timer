module moduleName (
    input clk_in,
    input CookTime_btn,
    input Start_btn,
    input Minutes,btn,
    input Seconds_btn,
    input TimerEN_sw,
    input reset_sw,
    output [7:0] an,
    output [6:0] seg,
    output TimerON_led,
    output TimerEN_led
);
    wire clk_5MHz;
    wire counterCLK_1Hz;
    wire displayCLK_500Hz;

    wire [3:0] tens_minutes_count, minutes_count, tens_seconds_count, seconds_cont;

    clock_divier counter_clk_divider(
        .clk_in(clk_5MHz),
        .clk_out(counterCLK_1Hz),
        .enable(1)
    );
    defparam counter_clk_divider.CLK_DIV = 2_500_000;

    clock_divier display_clk_divider(
        .clk_in(clk_5MHz),
        .clk_out(displayCLK_500Hz),
        .enable(1)
    );
    defparam display_clk_divider.CLK_DIV = 5_000;

    CounterCore time_counter(
        .clk_in(counterCLK_1Hz),
        .clk_en(TimerEN_sw),
        .load(0),
        .data(16'b0000_0000_0000_0000),
        .reset(reset_sw),
        .Count_0001(seconds_cont),
        .Count_0010(tens_seconds_count),
        .Count_0100(minutes_count),
        .Count_1000(tens_minutes_count)
    );

    assign TimerEN_led = TimerEN_sw;
    assign TimerON_led = TimerEN_sw & counterCLK_1Hz;
endmodule