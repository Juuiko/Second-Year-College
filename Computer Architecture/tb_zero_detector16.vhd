library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity zero_detector16_tb is
end;

architecture bench of zero_detector16_tb is

  component zero_detector16
  	port(
  		G : in std_logic_vector (15 downto 0);
  		Z : out std_logic);
  end component;

  signal G: std_logic_vector (15 downto 0);
  signal Z: std_logic;
  
      constant clk_period: Time := 2 ns;

begin

  uut: zero_detector16 port map ( G => G,
                                  Z => Z );

  stimulus: process
  begin
  
    G <= "1111111111111111";
    
    wait for clk_period;    
    wait for clk_period;
   
    G <= "0000000000000000";
    
    wait for clk_period;
    wait for clk_period;
    
    
    G <= "0000000000000001";
    
    wait;
  end process;

end;