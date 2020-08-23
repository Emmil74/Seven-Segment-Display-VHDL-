library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity newdipsw is
 Port ( DPSwitch : in STD_LOGIC_VECTOR (4 downto 1);
 Enable : out STD_LOGIC;
 SevenSegment : out STD_LOGIC_VECTOR (8 downto 1));
end newdipsw;


architecture Behavioral of newdipsw is
begin

Enable <= '0';

-- 7segment LED display order: (a,b,c,dp,d,e,f,g)

process(DPSwitch)
begin
case(DPSwitch) is
 when "1111" => SevenSegment <= "00010001"; -- Display 0 when BCD = 0000
 when "1110" => SevenSegment <= "10011111"; -- Display 1 when BCD = 0001
 when "1101" => SevenSegment <= "00110010"; -- Display 2 when BCD = 0010
 when "1100" => SevenSegment <= "00010110"; -- Display 3 when BCD = 0011
 when "1011" => SevenSegment <= "10011100"; -- Display 4 when BCD = 0100
 when "1010" => SevenSegment <= "01010100"; -- Display 5 when BCD = 0101
 when "1001" => SevenSegment <= "11010000"; -- Display 6 when BCD = 0110
 when "1000" => SevenSegment <= "00011111"; -- Display 7 when BCD = 0111
 when "0111" => SevenSegment <= "00010000"; -- Display 8 when BCD = 1000
 when "0110" => SevenSegment <= "00011100"; -- Display 9 when BCD = 1001
 when others => SevenSegment <= "11111110"; -- Segment only displays digits 0-9, any other value will display "-"
end case;
end process;
end Behavioral;
