FROM busybox
COPY index.html /home
EXPOSE 80/tcp
ENTRYPOINT ["httpd"]
CMD ["-h", "/home", "-f"]
