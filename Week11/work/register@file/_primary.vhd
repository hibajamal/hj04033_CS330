library verilog;
use verilog.vl_types.all;
entity registerFile is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        RegWrite        : in     vl_logic;
        WriteData       : in     vl_logic_vector(63 downto 0);
        RS1             : in     vl_logic_vector(4 downto 0);
        RS2             : in     vl_logic_vector(4 downto 0);
        RD              : in     vl_logic_vector(4 downto 0);
        ReadData1       : out    vl_logic_vector(63 downto 0);
        ReadData2       : out    vl_logic_vector(63 downto 0)
    );
end registerFile;
