module path_Capstone(
    //clk and rst
    input logic clk,
    input logic rst,
    
    //Input signals In, Out[1], Out[0], Hamming Distance
    input logic in,
    input logic [1:0] out,
    input logic Hamming_Distance,
    output [4:0] output_path
    );
    
    // Input[2] Input[1] Input[0] Hamming_Distance(Unsigned int = 8bit = 1byte)
    logic [4:0] path [7:0];
    integer i;
    integer j;
    
    always @(posedge clk or rst) begin
        //Reset everything
        if (rst) begin
            for (i = 0; i < 8; i = i+1) begin
                path[i] <= 5'b00000;
            end
        //Otherwise, start logic
        end else begin
            for (j=0; j < 8; j = j+1) begin
                if (path[j][4:0] == 5'bXXXXX) begin
                    path[j][4] <= in;
                    path[j][3:2] <= out;
                    path[j][1:0] <= Hamming_Distance;
                    break;
                end else if (path[j][4:0] == {in, out, Hamming_Distance}) begin
                    break;
                end
            end
            
            //Use encoder to generate first branch
            //encoder encoder_v0(
            //.unencoded_bits(1'b1),
            //.clk(clk),
            //.choose_constraint_length(3'b011),
            //.out(path[0][2:1])
            //);
            //path[0][0] <= 1'b1;
            
            //Use encoder to generate second branch
            //encoder encoder_v1(
            //.unencoded_bits(1'b0),
            //.clk(clk),
            //.choose_constraint_length(3'b011),
            //.out(path[1][2:1])
            //);
            //path[1][0] <= 1'b0;
            
        end
    end
    
endmodule