library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity program_counter_tb is
end;

architecture bench of program_counter_tb is

  component program_counter
  	port(
  		add : in std_logic_vector(15 downto 0);
  		PI : in std_logic;
  		PL : in std_logic;
  		clk : in std_logic;
  		reset : in std_logic;
          PC_out : out std_logic_vector(15 downto 0));	
  end component;

  signal add: std_logic_vector(15 downto 0);
  signal PI: std_logic;
  signal PL: std_logic;
  signal clk: std_logic;
  signal reset: std_logic;
  signal PC_out: std_logic_vector(15 downto 0);
  
     constant clock: Time := 20 ns;

begin

  uut: program_counter port map ( add    => add,
                                  PI     => PI,
                                  PL     => PL,
                                  clk    => clk,
                                  reset  => reset,
                                  PC_out => PC_out );

  stimulus: process
  begin

      wait for clock;
      clk <= '1';
      wait for clock;
      clk <= '0';
      add <= X"000A";

      wait for clock;
      clk <= '1';
      wait for clock;
      clk <= '0';
      PL <= '1';

      wait for clock;
      clk <= '1';
      wait for clock;
      clk <= '0';
      PL <= '0';
      PI <= '1';

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
      PL <= '1';
      PI <= '0';
      add <= X"0010";

      wait for clock;
      clk <= '1';
      wait for clock;
      clk <= '0';
      PL <= '0';
      PI <= '1';
      reset <= '1';

      wait for clock;
      clk <= '1';
      wait for clock;
      clk <= '0';
      reset <= '0';

      wait for clock;
      clk <= '1';
      PL <= '0';
      PI <= '0';

    wait;
  end process;


end;