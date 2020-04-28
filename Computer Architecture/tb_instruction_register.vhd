library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity instruction_register_tb is
end;

architecture bench of instruction_register_tb is

  component instruction_register
  	port(
  		inst_in : in std_logic_vector (15 downto 0);
  		IL : in std_logic;
  		clk : in std_logic;
  		opcode : out std_logic_vector (6 downto 0);
  		DR : out std_logic_vector (2 downto 0);
  		SA : out std_logic_vector (2 downto 0);
  		SB : out std_logic_vector (2 downto 0));
  end component;

  signal inst_in: std_logic_vector (15 downto 0);
  signal IL: std_logic;
  signal clk: std_logic;
  signal opcode: std_logic_vector (6 downto 0);
  signal DR: std_logic_vector (2 downto 0);
  signal SA: std_logic_vector (2 downto 0);
  signal SB: std_logic_vector (2 downto 0);

  constant clock: time := 40 ns;

begin

  uut: instruction_register port map ( inst_in => inst_in,
                                       IL      => IL,
                                       clk     => clk,
                                       opcode  => opcode,
                                       DR      => DR,
                                       SA      => SA,
                                       SB      => SB );

  stimulus: process
  begin
  
    clk <= '0';
    inst_in <= "1111111111111111";
    IL <= '0';
    
    wait for clock;
    clk <= '1';
    wait for clock;
    clk <= '0';
    IL <= '1';
    
    wait for clock;
    clk <= '1';
    wait for clock;
    clk <= '0';
    inst_in <= "0001110001110001";
    
    wait for clock;
    clk <= '1';
    wait for clock;
    clk <= '0';
    inst_in <= "0000000000000000";
    IL <= '0';
    
    wait for clock;
    clk <= '1';
    wait for clock;
    clk <= '0';
    IL <= '1';
    
    wait for clock;
    clk <= '1';
    
    wait;
  end process;

end;