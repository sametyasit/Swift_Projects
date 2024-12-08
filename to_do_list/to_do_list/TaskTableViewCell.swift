import UIKit

class TaskTableViewCell: UITableViewCell {

    // Programatik olarak tanımlanan UILabel
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()

    // Programatik olarak tanımlanan UIView (Renkli daire)
    private let priorityIndicator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    // Hücre başlatma metotları
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    // Bileşenleri kur ve Auto Layout kurallarını ekle
    private func setupViews() {
        // Alt görselleri hücreye ekle
        contentView.addSubview(titleLabel)
        contentView.addSubview(priorityIndicator)

        // Auto Layout kuralları
        NSLayoutConstraint.activate([
            // Title Label Auto Layout
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: priorityIndicator.leadingAnchor, constant: -16),

            // Priority Indicator Auto Layout
            priorityIndicator.widthAnchor.constraint(equalToConstant: 20),
            priorityIndicator.heightAnchor.constraint(equalToConstant: 20),
            priorityIndicator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            priorityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])

        // Priority Indicator için köşeleri yuvarla
        priorityIndicator.layer.cornerRadius = 10
        priorityIndicator.clipsToBounds = true
    }

    // Hücreyi verilerle yapılandır
    func configure(with task: Task) {
        titleLabel.text = task.title
        priorityIndicator.backgroundColor = task.priority.color()
    }
}
