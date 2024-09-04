#!/bin/bash

# Bitsys Technologies AB
# Ange önskad tidsserver
tidsserver="time.apple.com"

# Hämta den nuvarande tidsservern
aktuell_tidsserver=$(sudo systemsetup -getnetworktimeserver | awk '{print $4}')

# Kontrollera om tidsservern redan är inställd på time.apple.com
if [ "$aktuell_tidsserver" == "$tidsserver" ]; then
    echo "⌚️ Tidsservern är redan inställd på $tidsserver. Inget att göra."
else
    # Om tidsservern inte är inställd på time.apple.com, försök att ändra den
    sudo systemsetup -setnetworktimeserver $tidsserver

    # Kontrollera om tidsservern har ändrats korrekt
    aktuell_tidsserver=$(sudo systemsetup -getnetworktimeserver | awk '{print $4}')
    if [ "$aktuell_tidsserver" == "$tidsserver" ]; then
        echo "⌚️ Tidsservern har ändrats till $tidsserver"
    else
        echo "⌚️ Kunde inte ändra tidsservern"
    fi
fi
