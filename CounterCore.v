module CounterCore (
    input clk_in,
    input clk_en,
    input load,
    input [15:0] data,
    input reset,
    output [3:0] Count_0001,
    output [3:0] Count_0010,
    output [3:0] Count_0100,
    output [3:0] Count_1000,
    output Thresh_0001,
    output Thresh_0010,
    output Thresh_0100,
    output Thresh_1000,
    output Thresh_out
);
    up_down_counter counter_0001(
        .clk_in(clk_in),
        .clk_en(clk_en),
        .load(load),
        .data(data[3:0]),
        .reset(reset),
        .count(Count_0001),
        .thresh(Thresh_0001)
    );

    up_down_counter counter_0010(
        .clk_in(clk_in),
        .clk_en(clk_en & Thresh_0001),
        .load(load),
        .data(data[7:4]),
        .reset(reset),
        .count(Count_0010),
        .thresh(Thresh_0010)
    );

    up_down_counter counter_0100(
        .clk_in(clk_in),
        .clk_en(clk_en & Thresh_0001 & Thresh_0010),
        .load(load),
        .data(data[11:8]),
        .reset(reset),
        .count(Count_0100),
        .thresh(Thresh_0100)
    );

    up_down_counter counter_1000(
        .clk_in(clk_in),
        .clk_en(clk_en & Thresh_0001 & Thresh_0010 & Thresh_0100),
        .load(load),
        .data(data[15:12]),
        .reset(reset),
        .count(Count_1000),
        .thresh(Thresh_1000)
    );

    assign Thresh_out = clk_en & Thresh_0001 & Thresh_0010 & Thresh_0100 & Thresh_1000;
endmodule