for dir in ./*/ ; do
    cd $dir
    trimmed_path="${dir%/}"
    ../../tools/build.sh $trimmed_path
    if [ $? -ne 0 ]; then
        echo "Build failed for $trimmed_path"
        exit 1
    fi
    cd ..
done
