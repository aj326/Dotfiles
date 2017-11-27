# run me to get the party started

# create the folder structure
mkdir -p zsh_demo/{data,calculations}/africa/{kenya,malawi}/ zsh_demo/{data,calculations}/europe/{malta,poland}/ zsh_demo/{data,calculations}/asia/{nepal,laos}/

# create dummy files inside the data folder
for country_folder in zsh_demo/data/*/*; do
    dd if=/dev/zero of="${country_folder}/population.txt" bs=1024 count=1
    dd if=/dev/zero of="${country_folder}/income.txt" bs=2048 count=1
    dd if=/dev/zero of="${country_folder}/literacy.txt" bs=4096 count=1
    # we say these are dummy files because they don't have any content,
    # but we are making them occupy disk space
done

# create dummy files inside the calculations folder
for country_folder in zsh_demo/calculations/*/*; do
    touch "${country_folder}/population_by_province.txt"    # this file is empty
    dd if=/dev/zero of="${country_folder}/median_income.txt" bs=2048 count=1
    dd if=/dev/zero of="${country_folder}/literacy_index.txt" bs=4096 count=1
done

# because all the files are nested within the zsh_demo folder you will
# be able to easily delete them by running:
# rm -r zsh_demo
