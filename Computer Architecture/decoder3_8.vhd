library ieee;
use ieee.std_logic_1164.all;

entity decoder3_8 is
	port(
		A : in std_logic_vector(2 downto 0);
		q0 : out std_logic;
		q1 : out std_logic;
		q2 : out std_logic;
		q3 : out std_logic;
		q4 : out std_logic;
		q5 : out std_logic;
		q6 : out std_logic;
		q7 : out std_logic);		
end decoder3_8;

architecture behavioral of decoder3_8 is

	constant delay: Time := 1 ns;

begin
	q0 <= '1' when (A="000") else '0' after delay;
	q1 <= '1' when (A="001") else '0' after delay;
	q2 <= '1' when (A="010") else '0' after delay;
	q3 <= '1' when (A="011") else '0' after delay;
	q4 <= '1' when (A="100") else '0' after delay;
	q5 <= '1' when (A="101") else '0' after delay;
	q6 <= '1' when (A="110") else '0' after delay;
	q7 <= '1' when (A="111") else '0' after delay;
end behavioral;
