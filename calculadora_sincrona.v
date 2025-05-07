module calculadora_sincrona(
    input wire clk,
    input wire rst,
    input wire [7:0] entrada,
    input wire [2:0] codigo,
    output reg [7:0] saida
);

    // Registrador interno para armazenar o acumulador
    reg [7:0] acumulador;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            acumulador <= 8'b0;
            saida <= 8'b0;
        end else begin
            case (codigo)
                3'b000: begin // Mostrar entrada
                    saida <= entrada;
                    // acumulador não é modificado
                end
                3'b001: begin // Somar
                    acumulador <= acumulador + entrada;
                    saida <= 8'b0;
                end
                3'b010: begin // Subtrair
                    acumulador <= acumulador - entrada;
                    saida <= 8'b0;
                end
                3'b011: begin // Mostrar acumulador
                    saida <= acumulador;
                    // acumulador não é modificado
                end
                default: begin
                    // Para códigos inválidos, não altera nada
                    saida <= saida;
                    acumulador <= acumulador;
                end
            endcase
        end
    end

endmodule
