storage {
  afterCreate { item ->
    if (item.isFolder()) return;
    def sha1 = repositories.getFileInfo(item.repoPath).checksumInfo.sha1;
    def fs = new File(ctx.artifactoryHome.dataDir, 'filestore');
    def file = new File(fs, "${sha1.substring(0, 2)}/$sha1");
    "ruby avscan.rb $item.repoKey/$item.relPath $file.canonicalPath".execute();
  }
}