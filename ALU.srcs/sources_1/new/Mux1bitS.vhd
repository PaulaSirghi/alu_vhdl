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

entity Mux1bitS is
  Port (en: in std_logic;
        A: in std_logic;
        B: in std_logic;
        s: in std_logic;
        rez: out std_logic);
end Mux1bitS;

architecture Behavioral of Mux1bitS is

begin
process(A,B,s)
begin
        case s is 
          when '0'=>
          rez<=A;
          when '1'=>
          rez<=B;
          when others=>rez<='X';
        end case;
    
end process;

end Behavioral;
