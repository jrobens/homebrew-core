class SshCopyId < Formula
  desc "Add a public key to a remote machine's authorized_keys file"
  homepage "https://www.openssh.com/"
  url "https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.5p1.tar.gz"
  mirror "https://cloudflare.cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.5p1.tar.gz"
  version "9.5p1"
  sha256 "f026e7b79ba7fb540f75182af96dc8a8f1db395f922bbc9f6ca603672686086b"
  license "SSH-OpenSSH"
  head "https://github.com/openssh/openssh-portable.git", branch: "master"

  livecheck do
    formula "openssh"
  end

  bottle do
    sha256 cellar: :any_skip_relocation, all: "4b2adbe299c4c96d1caae15c5b2f46b6115f52028d0bf84cc29b416054c020ca"
  end

  keg_only :provided_by_macos

  def install
    bin.install "contrib/ssh-copy-id"
    man1.install "contrib/ssh-copy-id.1"
  end

  test do
    output = shell_output("#{bin}/ssh-copy-id -h 2>&1", 1)
    assert_match "identity_file", output
  end
end
