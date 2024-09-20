/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

/**
 * Traduz mnemônicos da linguagem assembly para códigos binários da arquitetura Z0.
 */
public class Code {

    /**
     * Retorna o código binário do(s) registrador(es) que vão receber o valor da instrução.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 4 bits) com código em linguagem de máquina para a instrução.
     */
    public static String dest(String[] mnemnonic) {
        /* TODO: implementar */
        int result = 0; // Use um inteiro para armazenar o resultado da codificação do registrador

        switch (mnemnonic[0]) {
            case "incw":
            case "decw":
            case "notw":
            case "negw":
                if (mnemnonic[1].equals("%D")) result |= 2;   // 0010
                if (mnemnonic[1].equals("(%A)")) result |= 4; // 0100
                if (mnemnonic[1].equals("%A")) result |= 1;   // 0001
                break;

            case "movw":
                if (mnemnonic.length == 4) {
                    // Aqui você implementa a lógica específica para quando há exatamente três componentes no mnemônico
                    if (mnemnonic[2].equals("%D")) result |= 2;
                    if (mnemnonic[2].equals("(%A)")) result |= 4;
                    if (mnemnonic[2].equals("%A")) result |= 1;
                    if (mnemnonic[3].equals("%D")) result |= 2;
                    if (mnemnonic[3].equals("(%A)")) result |= 4;
                    if (mnemnonic[3].equals("%A")) result |= 1;
                } else{
                    if (mnemnonic[2].equals("%D")) result |= 2;
                    if (mnemnonic[2].equals("(%A)")) result |= 4;
                    if (mnemnonic[2].equals("%A")) result |= 1;
                }
                break;

            case "addw":
            case "subw":
            case "rsubw":
            case "orw":
            case "andw":
                if (mnemnonic[3].equals("%D")) result |= 2;
                if (mnemnonic[3].equals("(%A)")) result |= 4;
                if (mnemnonic[3].equals("%A")) result |= 1;
                break;

            default:
                return "0000"; // Caso padrão retorna "0000"
        }

        return String.format("%04d", Integer.parseInt(Integer.toBinaryString(result)));
    }
    

    /**
 * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
 * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
 * @return Opcode (String de 9 bits) com código em linguagem de máquina para a instrução.
 */
public static String comp(String[] mnemnonic) {
    int result = 0; // Use um inteiro para armazenar o resultado da codificação do registrador

    switch (mnemnonic[0]) {
        case "incw":
            if (mnemnonic[1].equals("%D")) result = 0b0011111;   // 11111
            if (mnemnonic[1].equals("%A")) result = 0b0110111;   // 110111
            if (mnemnonic[1].equals("(%A)")) result = 0b1110111; // 1110111
            break;
        case "decw":
            if (mnemnonic[1].equals("%D")) result = 0b0001110;   // 11110
            if (mnemnonic[1].equals("%A")) result = 0b0110010;   // 110010
            break;
        case "notw":
            if (mnemnonic[1].equals("%D")) result = 0b0001101;   // 11101
            if (mnemnonic[1].equals("%A")) result = 0b0110001;   // 110001
            break;
        case "negw":
            if (mnemnonic[1].equals("%D")) result = 0b0001111;   // 11111
            if (mnemnonic[1].equals("%A")) result = 0b0110011;   // 110011
            break;
        case "movw":
            if (mnemnonic[1].equals("%A")) result = 0b0110000;   // 110000
            if (mnemnonic[1].equals("(%A)")) result = 0b1110000; // 1110000
            if (mnemnonic[1].equals("%D")) result = 0b0001100;   // 11000
            if (mnemnonic[1].equals("$1")) result = 0b0111111;
            if (mnemnonic[1].equals("$0")) result = 0b0101010;   // 111011
            break;
        case "addw":
            if (mnemnonic[1].equals("%A") && mnemnonic[2].equals("%D")) result = 0b0000010;  // 0000010
            if (mnemnonic[1].equals("(%A)") && mnemnonic[2].equals("%D")) result = 0b1000010; // 1000010
            if (mnemnonic[1].equals("$1")) result |= 0b0111011;  // 111011
            if (mnemnonic[1].equals("$1") && mnemnonic[2].equals("(%A)") && mnemnonic[3].equals("%D")) result = 0b1110111;
            break;
        case "subw":
            if (mnemnonic[1].equals("%D") && mnemnonic[2].equals("(%A)")) result = 0b1010011; // 1010011
            if (mnemnonic[1].equals("(%A)") && mnemnonic[2].equals("$1")) result = 0b1110010; // 1110010
            break;
        case "rsubw":
            if (mnemnonic[1].equals("%D") && mnemnonic[2].equals("(%A)")) result = 0b1000111; // 1000111
            break;
        case "orw":
            if (mnemnonic[1].equals("(%A)") && mnemnonic[2].equals("%D")) result = 0b1010101; // 1010101
            if (mnemnonic[1].equals("%D") && mnemnonic[2].equals("%A")) result = 0b0010101;   // 100101
            break;
        case "andw":
            if (mnemnonic[1].equals("(%A)") && mnemnonic[2].equals("%D")) result = 0b1000000; // 1000000
            if (mnemnonic[1].equals("%D") && mnemnonic[2].equals("%A")) result = 0b0000000;   // 0000000
            break;
        case "jmp":
        case "jg": 
        case "je": 
        case "jge":
        case "jl": 
        case "jne": 
        case "jle":
            result = 0b0001100; // 11000
            break;
        case "nop":
            result = 0b0001100; // NOP é usualmente representado por 0
            break;
    }
    return String.format("%09d", Integer.parseInt(Integer.toBinaryString(result)));
}


    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
        switch (mnemnonic[0]) {
            case "jmp": return "111";
            case "jg": return "001";
            case "je": return "010";
            case "jge": return "011";
            case "jl": return "100";
            case "jne": return "101";
            case "jle": return "110";
        
            default:
                return "000";
        }
    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
        /* TODO: implementar */

        int decimal = Integer.parseInt(symbol);

        // Converte o valor inteiro para uma representação binária.
        String binaryString = Integer.toBinaryString(decimal);

        while (binaryString.length() < 16) {
            binaryString = "0" + binaryString;
        }

        return binaryString;
        
    }

}
