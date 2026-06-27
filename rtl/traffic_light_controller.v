module traffic_light_controller(
    input clk,
    input rst,

    output reg NS_R,
    output reg NS_Y,
    output reg NS_G,

    output reg EW_R,
    output reg EW_Y,
    output reg EW_G
);

reg [2:0] state;
reg [3:0] counter;

// State Encoding
parameter S0 = 3'd0;   // NS Green
parameter S1 = 3'd1;   // NS Yellow
parameter S2 = 3'd2;   // All Red
parameter S3 = 3'd3;   // EW Green
parameter S4 = 3'd4;   // EW Yellow
parameter S5 = 3'd5;   // All Red

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        state <= S0;
        counter <= 0;
    end
    else
    begin
        counter <= counter + 1;

        case(state)

        S0:
            if(counter == 5)
            begin
                state <= S1;
                counter <= 0;
            end

        S1:
            if(counter == 2)
            begin
                state <= S2;
                counter <= 0;
            end

        S2:
            if(counter == 1)
            begin
                state <= S3;
                counter <= 0;
            end

        S3:
            if(counter == 5)
            begin
                state <= S4;
                counter <= 0;
            end

        S4:
            if(counter == 2)
            begin
                state <= S5;
                counter <= 0;
            end

        S5:
            if(counter == 1)
            begin
                state <= S0;
                counter <= 0;
            end

        endcase
    end
end

always @(*)
begin

    // Default OFF
    NS_R = 0;
    NS_Y = 0;
    NS_G = 0;

    EW_R = 0;
    EW_Y = 0;
    EW_G = 0;

    case(state)

    S0:
    begin
        NS_G = 1;
        EW_R = 1;
    end

    S1:
    begin
        NS_Y = 1;
        EW_R = 1;
    end

    S2:
    begin
        NS_R = 1;
        EW_R = 1;
    end

    S3:
    begin
        NS_R = 1;
        EW_G = 1;
    end

    S4:
    begin
        NS_R = 1;
        EW_Y = 1;
    end

    S5:
    begin
        NS_R = 1;
        EW_R = 1;
    end

    endcase

end

endmodule
