
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity reg16_tb is
end;

architecture bench of reg16_tb is

  component reg16
  	port(
  		D : in std_logic_vector(15 downto 0);
  		load : in std_logic;
  		clk : in std_logic;
  		Q : out std_logic_vector(15 downto 0));
  end component;

  signal D: std_logic_vector(15 downto 0);
  signal load: std_logic;
  signal clk: std_logic;
  signal Q: std_logic_vector(15 downto 0);
  
    constant tb_period : time := 10 ns;
    signal tb_clock : std_logic := '0';
    signal tb_ended : std_logic := '0';



begin

  uut: reg16 port map ( D    => D,
                        load => load,
                        clk  => clk,
                        Q    => Q );
    tb_clock <= not tb_clock after tb_period/2 when tb_ended /= '1' else '0';
    clk <= tb_clock;

  stimulus: process
  begin
  
    D <= x"0000";
    load <= '1';
    wait for 10ns;

    D <= x"1111";
    wait for 10ns;

    load <= '0';
    D <= x"0000";
    wait for 10ns;

    D <= x"1010";
    load <= '1';
    wait for 10ns;
   
    D <= x"0101";

    wait;
  end process;
end;