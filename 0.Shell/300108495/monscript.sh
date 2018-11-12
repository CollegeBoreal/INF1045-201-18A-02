
#!/bin/sh

for file in f*
do
  mv "$file" "${file%}.txt"
done

