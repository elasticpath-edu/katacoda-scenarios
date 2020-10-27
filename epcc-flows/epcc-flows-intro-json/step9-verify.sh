newman run collection.json --folder "Verify customer wishlist" -e environment.json --export-environment environment.json
grep -q "PASSED" /root/environment.json && echo "done"