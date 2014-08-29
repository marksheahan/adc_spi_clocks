`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/24/2014 11:11:44 PM
// Design Name: 
// Module Name: adc_spi_clocks
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adc_spi_clocks(
    input ADC_SPI_RESETN,
    input ADC_SPI_MASTER_CLK,
    output ADC_SPI_SCK,
    output ADC_SPI_CNV
    );
    
// count up to 128
reg [6:0] c;
reg sck;
reg cnv;    
    
always @(posedge ADC_SPI_MASTER_CLK) begin
    if (!ADC_SPI_RESETN) begin
        c <= {6{1'b0}};
        sck <= 0;
        cnv <= 0;
    end else begin
        if (c <= 90) begin
            cnv <= 1;
        end else begin
            cnv <= 0;
        end
        if (c >= 94 && c <= 126) begin
            sck <= c[0];
        end else begin
            sck <= 0;
        end 
        c <= c + 1;
    end
end     
    
assign ADC_SPI_SCK = sck;
assign ADC_SPI_CNV = cnv;

endmodule
