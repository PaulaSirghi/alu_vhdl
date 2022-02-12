----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2021 16:50:50
-- Design Name: 
-- Module Name: registru - Behavioral
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

entity registru is
  Port (D: in std_logic_vector(31 downto 0);
  load: in std_logic;
  clk: in std_logic;
  Q: out std_logic_vector(31 downto 0));
end registru;

architecture Behavioral of registru is

begin

process(load)
begin
  if rising_edge(load) then
     if load = '1' then
        Q<=D;
     end if;
  end if;
end process;

end Behavioral;
