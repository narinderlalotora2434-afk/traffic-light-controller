library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity traffic_light is
    Port (
        clk   : in STD_LOGIC;
        reset : in STD_LOGIC;
        red   : out STD_LOGIC;
        yellow: out STD_LOGIC;
        green : out STD_LOGIC
    );
end traffic_light;

architecture Behavioral of traffic_light is

    type state_type is (RED_STATE, GREEN_STATE, YELLOW_STATE);
    signal state : state_type := RED_STATE;
    signal count : integer := 0;

begin

process(clk, reset)
begin
    if reset = '1' then
        state <= RED_STATE;
        count <= 0;

    elsif rising_edge(clk) then
        count <= count + 1;

        case state is

            when RED_STATE =>
                red <= '1';
                yellow <= '0';
                green <= '0';

                if count = 5 then
                    state <= GREEN_STATE;
                    count <= 0;
                end if;

            when GREEN_STATE =>
                red <= '0';
                yellow <= '0';
                green <= '1';

                if count = 5 then
                    state <= YELLOW_STATE;
                    count <= 0;
                end if;

            when YELLOW_STATE =>
                red <= '0';
                yellow <= '1';
                green <= '0';

                if count = 2 then
                    state <= RED_STATE;
                    count <= 0;
                end if;

        end case;
    end if;
end process;

end Behavioral;
