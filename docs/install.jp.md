# 1. インストール

[English](install.md) | 日本語

> この文書は AI（Claude Sonnet 5）によって翻訳されました。誤りや不自然な表現が含まれている可能性があります。

更新日 2026-07-14

このチュートリアルでは、計算解析に `jupyter` インターフェースを、必要なソフトウェアのインストールに `conda` パッケージマネージャーを使用します。バイオインフォマティクス用のワークステーション設定については[こちら](https://github.com/auberginekenobi/protocols/tree/main/0_Setting_up_your_workstation)を参照してください。以下の手順に従って、お使いのコンピュータにインストールしてください。

## 1.1.1. ローカルインストール（Linux & Mac OS）[^1]
- （任意）[git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) のインストール手順に従ってください。[^2]
- [miniforge 版の conda](https://github.com/conda-forge/miniforge) のインストール手順に従ってください。インストールのプロンプトを進み、シェルプロファイルを更新して conda を自動的に初期化するかどうかのプロンプトには「yes」と入力してください。[^3]
- jupyter をインストールします: `conda install -n base jupyterlab`。

## 1.1.2. ローカルインストール（Windows）
多くのバイオインフォマティクス用ソフトウェアは Windows 向けにコンパイルされていません。この問題を解決するため、Microsoft は [Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/install) プロジェクトを提供しています。WSL をインストールした後、上記の Linux 向けの手順に従ってください。

## 1.2. 依存パッケージのインストール
バイオインフォマティクス解析の多くは、他の人が作成・配布している既存のソフトウェア（*パッケージ*）を利用します。それらのパッケージはさらに、動作のために別のサードパーティ製パッケージ（*依存パッケージ*、dependencies）を必要とし、それらの依存パッケージもまた別の依存パッケージを必要とする、といった具合に連なっていきます。本チュートリアルでは Illumina のメチル化アレイデータを解析するために `minfi` パッケージを使用しますが、その*依存関係ツリー*全体は、それぞれ特定のバージョンを持つ約 266 個のソフトウェアパッケージから成ります。これらをインストールするために `conda` *パッケージマネージャー* を使用します。
- bash のコマンドラインインターフェース（CLI）を開きます。Linux と Mac OS では `Terminal`、Windows では（前のセクションでインストールした）WSL を使用します。
- **コードをダウンロードする。** Git は他のソフトウェアを管理・配布するためのソフトウェアです。CLI で `git clone https://github.com/auberginekenobi/methylation-analysis-tutorial.git` を実行し、本チュートリアルのコードをダウンロードしてください。[^2]
- **環境をセットアップする。** *仮想環境*（virtual environment, VE）とは、特定のタスクを実行するために必要なソフトウェアツール一式を隔離した環境のことです。`conda` を使って、メチル化解析に必要なすべてのソフトウェアのための仮想環境を作成します。
- 本チュートリアルに必要なソフトウェアは、このリポジトリの `environment.yml` ファイルに記載されています。`conda env create --file=methylation-analysis-tutorial/environment.yml`[^4] を実行して VE を作成し、すべての依存パッケージをインストールしてください。**この処理には時間がかかります。**
- `conda activate methylation-tutorial` を実行して、新しく作成した VE に入ります。
- `Rscript -e 'IRkernel::installspec(name = "methylation-tutorial", displayname = "methylation-tutorial")'` を実行します。これにより、この環境が `jupyter` から利用できるようになります。


[^1]: 本チュートリアルの以前のバージョンは GenePattern 上で提供されていましたが、GenePattern プロジェクトは 2026 年 6 月に終了し、現在は利用できません。
[^2]: `git` の使用は推奨されますが、本チュートリアルの実施に必須ではありません。git を使用しない場合は、代わりに[こちら](https://github.com/auberginekenobi/methylation-analysis-tutorial/archive/refs/heads/main.zip)から本プロジェクトのコードをダウンロードしてください。
[^3]: conda のインストールの詳細な手順は、[こちら](https://github.com/auberginekenobi/protocols/tree/main/0_Setting_up_your_workstation)のステップ 1〜5 に記載されています。
[^4]: Apple Silicon 搭載機にローカルインストールする場合は、Intel アーキテクチャ向けにコンパイルされたパッケージを使用するよう指定する必要があります: `CONDA_SUBDIR=osx-64 conda env create --file=methylation-analysis-tutorial/environment.yml`
