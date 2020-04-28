library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity car_tb is
end;

architecture bench of car_tb is

  component car
      port ( 
  		in_address : in std_logic_vector (7 downto 0);
          load_address : in std_logic;
          clk : in std_logic;
          out_address : out std_logic_vector (7 downto 0));
  end component;

  signal in_address: std_logic_vector (7 downto 0);
  signal load_address: std_logic;
  signal clk: std_logic;
  signal out_address: std_logic_vector (7 downto 0);

    constant clock: Time := 15 ns;

begin

  uut: car port map ( in_address   => in_address,
                      load_address => load_address,
                      clk          => clk,
                      out_address  => out_address );

  stimulus: process
  begin
  
      clk <= '0';    
      wait for clock;
      clk <= '1';
      wait for clock;

      clk <= '0';
      in_address <= X"AA";
      wait for clock;
      clk <= '1';
      wait for clock;

      clk <= '0';
      load_address <= '1';
      wait for clock;
      clk <= '1';
      wait for clock;

      clk <= '0';
      load_address <= '0';      
      wait for clock;
      clk <= '1';
      wait for clock;

      clk <= '0';      
      wait for clock;
      clk <= '1';
      wait for clock;
      
      clk <= '0';
      wait for clock;
      clk <= '1';
      wait for clock;
      
      clk <= '0';
      load_address <= '1';
      in_address <= X"10";
      wait for clock;
      clk <= '1';
      
    wait;
  end process;


end;