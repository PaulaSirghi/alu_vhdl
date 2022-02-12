----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.12.2021 21:07:38
-- Design Name: 
-- Module Name: comparator - Behavioral
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

entity comparator is
  Port (A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        test: in std_logic;
        rdy: out std_logic);
end comparator;

architecture Behavioral of comparator is

begin

process(A,B,test)
begin
  if test = '1' then
      if(A<B) then rdy<='1';
      else rdy<='0';
      end if;
  else rdy<='0';
  end if;
end process;

end Behavioral;
