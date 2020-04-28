library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity function_unit_tb is
end;

architecture bench of function_unit_tb is

  component function_unit
      port ( 
  		A : in std_logic_vector (15 downto 0);
          B : in std_logic_vector (15 downto 0);
          FS : in std_logic_vector (4 downto 0);
  		V : out std_logic;
  		C : out std_logic;
  		N : out std_logic;
  		Z : out std_logic;
  		F : out std_logic_vector (15 downto 0));
  end component;

  signal A: std_logic_vector (15 downto 0);
  signal B: std_logic_vector (15 downto 0);
  signal FS: std_logic_vector (4 downto 0);
  signal V: std_logic;
  signal C: std_logic;
  signal N: std_logic;
  signal Z: std_logic;
  signal F: std_logic_vector (15 downto 0);

    constant clk_period: Time := 80 ns;

begin

  uut: function_unit port map ( A  => A,
                                B  => B,
                                FS => FS,
                                V  => V,
                                C  => C,
                                N  => N,
                                Z  => Z,
                                F  => F );

  stimulus: process
  begin
  
    A <= "1010101010101010";
    B <= "0101010101010101";
    -- Fix A and B, change FS and check if outputs
    -- are as expected for each FS code
    
    FS <= "00000";
    wait for clk_period;
    -- F=A=0xAAAA
    -- V=0, C=0, N=1, Z=0
    
    FS <= "00001";
    wait for clk_period;
    -- F=A+1=0xAAAB
    -- V=0, C=0, N=1, Z=0
    
    FS <= "00010";
    wait for clk_period;
    -- F=0xFFFF
    -- V=0, C=0, N=1, Z=0
    
    FS <= "00100";
    wait for clk_period;
    -- F=A+(not)B=0x5554
    -- V=1, C=1, N=0, Z=0
    
    FS <= "00101";
    wait for clk_period;
    -- F=A+(not)B+1=0x5555
    -- V=1, C=1, N=0, Z=0
    
    FS <= "00110";
    wait for clk_period;
    -- F=A+0xFFFF=0xAAA9
    -- V=0, C=1, N=1, Z=0
    
    FS <= "00111";
    wait for clk_period;
    -- F=A+0xFFFF+1=0xAAAA
    -- V=0, C=1, N=1, Z=0
    
    -- Overflow and Carry flags are
    -- set by adder so are not defined
    -- for the operations below
    
    FS <= "01000";
    wait for clk_period;
    -- F=A&B=0x0000
    -- N=0, Z=1
    
    FS <= "01010";
    wait for clk_period;
    -- F=A|B=0xFFFF
    -- N=1, Z=0
    
    FS <= "01100";
    wait for clk_period;
    -- F=A^B=0xFFFF
    -- N=1, Z=0
    
    FS <= "01110";
    wait for clk_period;
    -- F=!A=0x5555
    -- N=0, Z=0

    wait;
  end process;


end;