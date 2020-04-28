library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity register_file_tb is
end;

architecture bench of register_file_tb is

  component register_file
      Port (  write : in std_logic;
              clk : in std_logic;
  			D_select : in std_logic_vector(2 downto 0);
  			D_data : in std_logic_vector(15 downto 0);
  			A_select : in std_logic_vector(2 downto 0);
  			A_data : out std_logic_vector(15 downto 0);
  			B_select : in std_logic_vector(2 downto 0);
              B_data : out std_logic_vector(15 downto 0));
  end component;

  signal write: std_logic;
  signal clk: std_logic;
  signal D_select: std_logic_vector(2 downto 0);
  signal D_data: std_logic_vector(15 downto 0);
  signal A_select: std_logic_vector(2 downto 0);
  signal A_data: std_logic_vector(15 downto 0);
  signal B_select: std_logic_vector(2 downto 0);
  signal B_data: std_logic_vector(15 downto 0);

    constant tb_period : time := 10 ns;
    signal tb_clock : std_logic := '0';
    signal tb_ended : std_logic := '0';


begin
  uut : register_file port map(
    write => write,
    clk => clk,
    D_select => D_select,
    D_data => D_data,
    A_select => A_select,
    A_data => A_data,
    B_select => B_select,
    B_data => B_data);
    

  tb_clock <= not tb_clock after tb_period/2 when tb_ended /= '1' else '0';
  clk <= tb_clock;


stim_proc : process
begin
--write to each reg
  write <= '1';
  D_data <= x"aaaa";
  D_select <= "000";
  wait for tb_period;

  D_data <= x"bbbb";
  D_select <= "001";
  wait for tb_period;

  D_data <= x"cccc";
  D_select <= "010";
  wait for tb_period;

  D_data <= x"dddd";
  D_select <= "011";
  wait for tb_period;

  D_data <= x"eeee";
  D_select <= "100";
  wait for tb_period;

  D_data <= x"ffff";
  D_select <= "101";
  wait for tb_period;

  D_data <= x"abab";
  D_select <= "110";
  wait for tb_period;

  D_data <= x"baba";
  D_select <= "111";
  wait for tb_period;

--read to each reg
  write <= '0';
  A_select <= "000";
  B_select <= "001";
  wait for tb_period;
  D_data <= x"0000";
  D_select <= "111";

  A_select <= "010";
  B_select <= "011";
  wait for tb_period;
  D_data <= x"1111";
  D_select <= "110";

  A_select <= "100";
  B_select <= "101";
  wait for tb_period;
  D_data <= x"2222";
  D_select <= "101";

  A_select <= "110";
  B_select <= "111";
  wait for tb_period;
  D_data <= x"3333";
  D_select <= "100";

  wait;
end process;
end;