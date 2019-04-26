library verilog;
use verilog.vl_types.all;
entity ALU_64_bit is
    port(
        a               : in     vl_logic_vector(63 downto 0);
        b               : in     vl_logic_vector(63 downto 0);
        ALUop           : in     vl_logic_vector(3 downto 0);
        Result          : out    vl_logic_vector(63 downto 0);
        CarryOut        : out    vl_logic
    );
end ALU_64_bit;
