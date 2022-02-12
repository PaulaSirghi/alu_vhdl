----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.11.2021 15:48:46
-- Design Name: 
-- Module Name: Mux1bitS - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UC is
  Port (I: in std_logic_vector(3 downto 0);
        sel: out std_logic;
        op: out std_logic_vector(2 downto 0);
        stg: out std_logic;
        logic: out std_logic_vector(1 downto 0));
end UC;

architecture Behavioral of UC is

begin
process(I)
begin
    case I is
    when "0000" => sel<='0';op<="000";stg<='X';logic<="XX"; --adunare
    when "0001" => sel<='1';op<="000";stg<='X';logic<="XX"; --scadere
    when "0010" => sel<='X';op<="010";stg<='X';logic<="00"; --si
    when "0011" => sel<='X';op<="010";stg<='X';logic<="01"; --sau
    when "0100" => sel<='X';op<="010";stg<='X';logic<="10"; --not
    when "0101" => sel<='X';op<="011";stg<='0';logic<="XX"; --rotate right
    when "0110" => sel<='X';op<="011";stg<='1';logic<="XX"; --rotate left
    when "0111" => sel<='X';op<="100";stg<='X';logic<="XX"; --*
    when "1000" => sel<='X';op<="101";stg<='X';logic<="XX"; --/
    when "1001" => sel<='X';op<="110";stg<='1';logic<="XX"; --shift left
    when "1010" => sel<='X';op<="110";stg<='0';logic<="XX"; --shitf right
    when "1011" => sel<='X';op<="111";stg<='X';logic<="XX"; --comp
    when others => sel<='X';op<="XXX";stg<='X';logic<="XX";
    end case;
end process;

end Behavioral;
