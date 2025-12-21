## Themes

### Locations of Files
- **Default themes:**  
  `/lib/pager/themes/wargames`
- **Custom themes:**  
  `/root/themes`

---

## Secure Copy (SCP) Over SSH

```bash
scp -r ./New-Theme/ root@172.16.52.1:/root/themes/
```

---

## Copy an Existing Theme

```bash
cp -r /lib/pager/themes/wargames/ /root/themes/mycooltheme
```

---

## Delete a Theme

```bash
rm -r /root/themes/mycooltheme
```

---

## Theme Setup Directions

```bash
# Open a terminal on your PC and connect
ssh root@172.16.52.1

# Copy the default theme
cp -r /lib/pager/themes/wargames/ /root/themes/mycooltheme

# Exit the device
exit

# Copy custom files
scp -r ./assets/ root@172.16.52.1:/root/themes/mycooltheme/
scp -r ./components/ root@172.16.52.1:/root/themes/mycooltheme/
```

### Enable the Theme
```
Settings → General → Theme → mycooltheme
```

---

## Ringtones

### Upload a Ringtone

```bash
scp -r ./starwars.rtttl root@172.16.52.1:/lib/pager/ringtones
```

### Select the Ringtone
```
Settings → Ringtones → starwars
```
